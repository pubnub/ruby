
  require 'spec_helper'

  describe Pubnub::Subscribe do
  around(:each) do |example|
    @message_output = Array.new
    @presence_message_output = Array.new

    @callback = lambda do |envelope|
      @message_output << envelope.msg
    end

    @presence_callback = lambda do |envelope|
      @presence_message_output << envelope.msg
    end

    @pubnub = Pubnub.new(subscribe_key: 'sub-c-9a20ffa4-0243-11e6-861b-02ee2ddab7fe', publish_key: 'pub-c-c617141c-b93e-4492-8b21-d6be4a9b009c')


    Celluloid.boot
    example.run
    Celluloid.shutdown
  end
it 'works fine with channel__group__presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/0', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461190762, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"leave", "timestamp"=>1461190763, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/1', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq []
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/4', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461191324, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/5', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq []
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/6', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461191604, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/7', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461191605, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/10', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461191885, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/11', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq []
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/12', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192166, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"join", "timestamp"=>1461192166, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/13', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192167, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"join", "timestamp"=>1461192167, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/16', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192172, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/17', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192172, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/18', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192174, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/19', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192176, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/22', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192180, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/23', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192181, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/24', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/25', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/28', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/29', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/30', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/31', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/34', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/35', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/36', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192200, "uuid"=>"8bba1db5-ea09-4e8c-9296-6b80e1f72a37", "occupancy"=>14}, {"action"=>"leave", "timestamp"=>1461192201, "uuid"=>"secondrubytester", "occupancy"=>13}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/37', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461192202, "uuid"=>"ace93010-7263-4d5f-9b55-ef42fdfe2f89", "occupancy"=>14}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/40', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461192206, "uuid"=>"secondrubytester", "occupancy"=>17}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/41', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461192207, "uuid"=>"5787d95c-1f68-4336-95d9-7b359bc658ed", "occupancy"=>18}, {"action"=>"join", "timestamp"=>1461192207, "uuid"=>"835f9921-3055-4b84-8f78-6d75a2dadcd3", "occupancy"=>19}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/42', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461192208, "uuid"=>"20e25b49-9c8a-4b2a-bfa5-a1f823a76cee", "occupancy"=>19}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/43', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461192210, "uuid"=>"8c604265-a185-49c4-9f19-9bfeff5d9f75", "occupancy"=>20}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/46', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/47', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/48', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192216, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"join", "timestamp"=>1461192216, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/49', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192217, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"join", "timestamp"=>1461192217, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"leave", "timestamp"=>1461192217, "uuid"=>"secondrubytester", "occupancy"=>0}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/52', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192220, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/53', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192222, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/54', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192222, "uuid"=>"secondrubytester", "occupancy"=>0}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/55', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461192224, "uuid"=>"secondrubytester", "occupancy"=>0}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/58', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/59', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461192230, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"join", "timestamp"=>1461192230, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/60', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/61', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/64', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/65', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/66', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/67', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/70', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/71', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/72', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/73', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/76', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/77', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/78', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/79', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/82', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/83', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/84', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/85', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/88', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/89', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461192265, "occupancy"=>29}, {"action"=>"interval", "timestamp"=>1461192266, "occupancy"=>30}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/90', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/91', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/94', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel__group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/95', record: :none) do
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>nil, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/96', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/97', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/100', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/101', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/102', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/103', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/106', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/107', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/108', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/109', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/112', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/113', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/114', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/115', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461192300, "occupancy"=>55}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/118', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/119', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/120', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461192306, "occupancy"=>36}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/121', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/124', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/125', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/126', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/127', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461192315, "occupancy"=>37}, {"action"=>"interval", "timestamp"=>1461192316, "occupancy"=>36}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/130', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/131', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/132', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/133', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/136', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/137', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/138', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/139', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/142', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/143', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/144', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/145', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/148', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/149', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/150', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/151', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", {"action"=>"interval", "timestamp"=>1461192350, "occupancy"=>91}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/154', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/155', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/156', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461192356, "occupancy"=>37}, {"action"=>"interval", "timestamp"=>1461192355, "occupancy"=>37}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/157', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/160', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/161', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/162', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/163', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/166', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/167', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/168', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/169', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/172', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/173', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/174', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/175', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/178', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/179', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/180', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/181', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/184', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/185', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/186', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/187', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/190', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", {"action"=>"interval", "timestamp"=>1461192400, "occupancy"=>132}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/191', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/192', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/193', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/196', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/197', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/198', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/199', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/202', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", {"action"=>"interval", "timestamp"=>1461192415, "occupancy"=>72}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/203', record: :none) do
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>:rubytest, :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461192416, "occupancy"=>72}, "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/204', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/205', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/208', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/209', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/210', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/211', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/214', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/215', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/216', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/217', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/220', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/221', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/222', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461192440, "occupancy"=>162}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/223', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/226', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/227', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/228', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/229', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/232', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/233', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/234', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/235', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461192455, "occupancy"=>73}, {"action"=>"interval", "timestamp"=>1461192456, "occupancy"=>73}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/238', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/239', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/240', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/241', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/244', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/245', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/246', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/247', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/250', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/251', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/252', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461222106, "uuid"=>"93ea0e4f-89a2-4b18-b700-310073cbf3a3", "occupancy"=>11}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/253', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461222108, "uuid"=>"78d65baf-ce38-480a-8da0-b7085b50d414", "occupancy"=>12}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/256', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", {"action"=>"join", "timestamp"=>1461222114, "uuid"=>"0aef976e-c58c-4271-94d9-5aa70bd8e784", "occupancy"=>15}, {"action"=>"join", "timestamp"=>1461222114, "uuid"=>"secondrubytester", "occupancy"=>16}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/257', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", {"action"=>"join", "timestamp"=>1461222116, "uuid"=>"9c236fa6-ee27-4d86-a512-752a6f274b47", "occupancy"=>16}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/258', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", {"action"=>"join", "timestamp"=>1461222117, "uuid"=>"secondrubytester", "occupancy"=>17}, {"action"=>"join", "timestamp"=>1461222118, "uuid"=>"00ffc277-18ed-46cd-a73c-e351680a61a9", "occupancy"=>18}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/259', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461222119, "uuid"=>"bf65872b-706c-4e45-a2f8-d23736823987", "occupancy"=>19}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/262', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/263', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/264', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461222129, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"join", "timestamp"=>1461222129, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/265', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461222129, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"join", "timestamp"=>1461222130, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/268', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461222135, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/269', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461222137, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"leave", "timestamp"=>1461222137, "uuid"=>"secondrubytester", "occupancy"=>0}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/270', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461222138, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"leave", "timestamp"=>1461222139, "uuid"=>"secondrubytester", "occupancy"=>0}, "test_message", "test_message", {"action"=>"join", "timestamp"=>1461222139, "uuid"=>"secondrubytester", "occupancy"=>1}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/271', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/274', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461222146, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"leave", "timestamp"=>1461222146, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/275', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461222148, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"leave", "timestamp"=>1461222148, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/276', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/277', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/280', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/281', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/282', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/283', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/286', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/287', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/288', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/289', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222173, "occupancy"=>48}, "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/292', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/293', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/294', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/295', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222183, "occupancy"=>54}, "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/298', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/299', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/300', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/301', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222194, "occupancy"=>25}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/304', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/305', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/306', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222204, "occupancy"=>32}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/307', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222205, "occupancy"=>32}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/310', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_rubytest_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/311', record: :none) do
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"rubytest", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/312', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/313', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/316', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/317', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/318', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/319', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/322', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/323', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/324', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/325', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/328', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/329', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/330', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/331', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/334', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/335', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/336', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/337', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/340', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/341', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/342', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/343', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/346', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/347', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/348', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/349', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/352', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/353', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/354', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/355', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/358', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/359', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/360', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/361', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/364', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/365', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/366', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/367', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/370', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/371', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/372', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/373', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/376', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/377', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/378', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/379', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/382', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/383', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/384', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/385', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/388', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/389', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/390', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/391', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/394', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/395', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/396', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/397', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222363, "occupancy"=>107}, "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/400', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/401', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/402', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/403', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222373, "occupancy"=>106}, "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/406', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/407', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/408', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/409', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461222384, "occupancy"=>133}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/412', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/413', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/414', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/415', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222395, "occupancy"=>140}, "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/418', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest0, :rubytest1]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/419', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest0, :rubytest1], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/420', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461222404, "uuid"=>"7cdd75cc-3105-4a9d-b489-96af110cccc1", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/421', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461222406, "uuid"=>"6fece45b-28c7-4e82-89b3-a9c79d312599", "occupancy"=>2}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/424', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222412, "uuid"=>"b54a8f43-f1b8-483b-8c98-5cef9f20a40c", "occupancy"=>5}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/425', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222413, "uuid"=>"8aa301e2-af29-4dda-9096-6c2c70f74a33", "occupancy"=>6}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/426', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222416, "uuid"=>"5420d1e1-e6f5-40da-927c-6696795f364c", "occupancy"=>7}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/427', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222418, "uuid"=>"03f77d60-2f9c-4bd8-8bdc-004d04724b74", "occupancy"=>8}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/430', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222424, "uuid"=>"b21951a7-e877-4d02-9e1c-30dd6856b1c7", "occupancy"=>11}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/431', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222425, "uuid"=>"e90de25b-c538-485c-9d22-2509d104f0cd", "occupancy"=>12}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/432', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222428, "uuid"=>"c6221332-d76c-48cf-ae73-cc2fd7fc58ba", "occupancy"=>13}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/433', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222429, "uuid"=>"a06884b5-eab2-4a10-9e17-37f8bf14de44", "occupancy"=>14}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/436', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222435, "uuid"=>"67764ecb-1fbb-4c2e-8e1a-b855315b2770", "occupancy"=>17}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/437', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222437, "uuid"=>"c903d9f2-275f-41d5-9180-0ba1bd6db01a", "occupancy"=>18}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/438', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222438, "uuid"=>"30db66da-01e5-42a2-8b67-e3e712091d41", "occupancy"=>19}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/439', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"join", "timestamp"=>1461222440, "uuid"=>"d6a73fb8-490c-4880-9414-46ecd066553f", "occupancy"=>20}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/442', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/443', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/444', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/445', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/448', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/449', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/450', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222462, "occupancy"=>31}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/451', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222464, "occupancy"=>145}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/454', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/455', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/456', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/457', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/460', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/461', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461222482, "occupancy"=>41}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/462', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/463', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/466', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/467', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/468', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/469', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/472', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/473', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/474', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/475', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/478', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/479', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/480', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/481', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/484', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/485', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/486', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461222602, "occupancy"=>68}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/487', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222604, "occupancy"=>70}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/490', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/491', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/492', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/493', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/496', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/497', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461222622, "occupancy"=>78}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/498', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/499', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/502', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222632, "occupancy"=>83}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/503', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/504', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/505', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/508', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/509', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/510', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/511', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/514', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/515', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/516', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/517', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/520', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222665, "occupancy"=>62}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/521', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/522', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/523', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222672, "occupancy"=>104}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/526', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_ruby.*_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/527', record: :none) do
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>"ruby.*", :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/528', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222682, "occupancy"=>110}, "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/529', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/532', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/533', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/534', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/535', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/538', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461222702, "occupancy"=>119}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/539', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/540', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/541', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/544', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/545', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/546', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/547', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/550', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/551', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/552', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/553', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/556', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/557', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/558', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222782, "occupancy"=>109}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/559', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461222784, "occupancy"=>36}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/562', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group__presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/563', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>nil, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461222792, "occupancy"=>109}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/564', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/565', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/568', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461222802, "occupancy"=>108}, "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/569', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/570', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/571', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/574', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/575', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/576', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/577', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/580', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/581', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/582', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223002, "occupancy"=>54}, "test_message", "test_message", {"action"=>"interval", "timestamp"=>1461223003, "occupancy"=>55}, "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/583', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/586', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223072, "occupancy"=>30}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/587', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461223143, "uuid"=>"f0d4592b-cdb7-4560-90ee-cf8926a1673e", "occupancy"=>14}, {"action"=>"join", "timestamp"=>1461223143, "uuid"=>"f0d4592b-cdb7-4560-90ee-cf8926a1673e", "occupancy"=>15}, "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/588', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", {"action"=>"join", "timestamp"=>1461223146, "uuid"=>"46b00fc7-d8bb-4497-bd1d-1e8b66c75a76", "occupancy"=>15}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/589', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"leave", "timestamp"=>1461223147, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"leave", "timestamp"=>1461223148, "uuid"=>"secondrubytester", "occupancy"=>0}, {"action"=>"join", "timestamp"=>1461223148, "uuid"=>"7567b51f-2a0e-4240-93f2-c7180dfd3097", "occupancy"=>16}, "test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/592', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"join", "timestamp"=>1461223153, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"join", "timestamp"=>1461223153, "uuid"=>"secondrubytester", "occupancy"=>1}, {"action"=>"join", "timestamp"=>1461223154, "uuid"=>"2913eb01-a4f8-4049-a298-233b37a7db3b", "occupancy"=>19}, {"action"=>"leave", "timestamp"=>1461223154, "uuid"=>"secondrubytester", "occupancy"=>0}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/593', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461223155, "uuid"=>"0584db48-2d96-4117-a7eb-075828ab11b9", "occupancy"=>20}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/594', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"join", "timestamp"=>1461223158, "uuid"=>"secondrubytester", "occupancy"=>1}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/595', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/598', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223257, "occupancy"=>25}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_rubytest_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/599', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>:rubytest, :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223267, "occupancy"=>23}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/600', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223277, "occupancy"=>22}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/601', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223287, "occupancy"=>23}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/604', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/605', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/606', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/607', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message", {"action"=>"interval", "timestamp"=>1461223337, "occupancy"=>24}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/610', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence__callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/611', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>nil, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/612', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461223347, "occupancy"=>30}, "test_message", {"action"=>"interval", "timestamp"=>1461223347, "occupancy"=>30}, "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/613', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/616', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/617', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/618', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/619', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/622', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_rubytest_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/623', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>:rubytest, :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", {"action"=>"interval", "timestamp"=>1461223367, "occupancy"=>41}, {"action"=>"interval", "timestamp"=>1461223367, "occupancy"=>40}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/624', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/625', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/628', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223377, "occupancy"=>44}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/629', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true}){ |e| @callback.call(e) }
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", {"action"=>"interval", "timestamp"=>1461223378, "occupancy"=>31}, {"action"=>"interval", "timestamp"=>1461223378, "occupancy"=>30}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/630', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/631', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message", "test_message", "test_message"]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_true_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/634', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>true, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq [{"action"=>"interval", "timestamp"=>1461223388, "occupancy"=>37}, {"action"=>"interval", "timestamp"=>1461223388, "occupancy"=>36}]
expect(@presence_message_output).to eq []
end
it 'works fine with channel_[:rubytest, "ruby.*"]_group_[:rubytest0, :rubytest1]_presence_[:rubytest0, :rubytest1]_callback_@callback_presence_callback_@presence_callback_ssl_false_http_sync_true' do
  VCR.use_cassette('test_examples/subscribe/635', record: :none) do
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
    @pubnub.subscribe({:channel=>[:rubytest, "ruby.*"], :group=>[:rubytest0, :rubytest1], :presence=>[:rubytest0, :rubytest1], :callback=>@callback, :presence_callback=>@presence_callback, :ssl=>false, :http_sync=>true})
  end
sleep 0.1
expect(@message_output).to          eq ["test_message", "test_message"]
expect(@presence_message_output).to eq []
end
end
