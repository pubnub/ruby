require 'spec_helper'

describe Pubnub::ChannelRegistration do

  let(:pubnub_client) { Pubnub.new(subscribe_key: 'demo', publish_key: 'demo') }
  let(:callback)      { lambda { |envelope| @envelopes = [envelope] } }

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  context 'sync' do
    it 'lists all namespaces' do
      VCR.use_cassette('integration/channel_registration/list-all-namespaces', :record => :once) do
        envelopes = pubnub_client.channel_registration(action: :list_namespaces, http_sync: true)
        expect(envelopes.first.status).to eq 200
        expect(envelopes.first.payload['namespaces']).to eq %w(foo namespace_test)
      end
    end

    it 'lists all non-namespaced channel groups' do
      VCR.use_cassette('integration/channel_registration/list-all-non-namespaced-cg', :record => :once) do
        envelopes = pubnub_client.channel_registration(action: :list_groups, http_sync: true)
        expect(envelopes.first.status).to eq 200
        expect(envelopes.first.payload['namespace']).to eq ''
        expect(envelopes.first.payload['groups']).to eq %w(cg dk1)
      end
    end

    it 'lists all cg in namespace' do
      VCR.use_cassette('integration/channel_registration/list-all-cg-in-ns', :record => :once) do
        envelopes = pubnub_client.channel_registration(action: :get, group: 'foo:', http_sync: true)
        expect(envelopes.first.status).to eq 200
        expect(envelopes.first.payload['namespace']).to eq 'foo'
        expect(envelopes.first.payload['groups']).to eq %w(foo new_group)
      end
    end

    it 'lists all channels in namespaced cg' do
      VCR.use_cassette('integration/channel_registration/list-all-c-in-in-ns-cg', :record => :once) do
        envelopes = pubnub_client.channel_registration(action: :get, group: 'foo:foo', http_sync: true)
        expect(envelopes.first.status).to eq 200
        expect(envelopes.first.payload['group']).to eq 'foo'
        expect(envelopes.first.payload['channels']).to eq %w(aaa bbb)
      end
    end

    it 'lists all channels in non-namespaced cg' do
      VCR.use_cassette('integration/channel_registration/list-all-c-in-non-ns-cg', :record => :once) do
        envelopes = pubnub_client.channel_registration(action: :get, group: ':cg', http_sync: true)
        expect(envelopes.first.status).to eq 200
        expect(envelopes.first.payload['group']).to eq 'cg'
        expect(envelopes.first.payload['channels']).to eq %w(ping_3 x z)
      end
    end

    context 'adding channel to cg' do
      it 'adds channel to cg if given channel symbol' do
        VCR.use_cassette('integration/channel_registration/add-c-as-symbol', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: :one, http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'adds channel to cg if given channel array' do
        VCR.use_cassette('integration/channel_registration/add-c-as-array', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: %w(one two), http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'adds channel to cg if given channel string' do
        VCR.use_cassette('integration/channel_registration/add-c-as-string', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: 'one', http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'adds channel to cg if given channel csv' do
        VCR.use_cassette('integration/channel_registration/add-c-as-csv', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: 'one,two', http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end
    end

    context 'removing channel from cg' do
      it 'removes channel from cg if given channel symbol' do
        VCR.use_cassette('integration/channel_registration/remove-c-as-symbol', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: :one, http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'removes channel from cg if given channel array' do
        VCR.use_cassette('integration/channel_registration/remove-c-as-array', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: %w(one two), http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'removes channel from cg if given channel string' do
        VCR.use_cassette('integration/channel_registration/remove-c-as-string', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: 'one', http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'removes channel from cg if given channel csv' do
        VCR.use_cassette('integration/channel_registration/remove-c-as-csv', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: 'one,two', http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'removes cg from ns' do
        VCR.use_cassette('integration/channel_registration/remove-cg-from-ns-csv', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :remove, group: 'foo:foo', http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end

      it 'removes ns' do
        VCR.use_cassette('integration/channel_registration/remove-ns-csv', :record => :once) do
          envelopes = pubnub_client.channel_registration(action: :remove, group: 'foo:', http_sync: true)
          expect(envelopes.first.status).to eq 200
          expect(envelopes.first.message).to eq 'OK'
          expect(envelopes.first.error).to eq false
        end
      end
    end
  end

  # context 'async' do
  #   it 'lists all namespaces' do
  #     VCR.use_cassette('integration/channel_registration/list-all-namespaces', :record => :once) do
  #       pubnub_client.channel_registration(action: :list_namespaces, http_sync: false, callback: callback)
  #       eventually do
  #         expect(@envelopes.first.status).to eq 200
  #         expect(@envelopes.first.payload['namespaces']).to eq %w(foo namespace_test)
  #       end
  #     end
  #   end
  #
  #   it 'lists all non-namespaced channel groups' do
  #     VCR.use_cassette('integration/channel_registration/list-all-non-namespaced-cg', :record => :once) do
  #       pubnub_client.channel_registration(action: :list_groups, http_sync: false, callback: callback)
  #       eventually do
  #         expect(@envelopes.first.status).to eq 200
  #         expect(@envelopes.first.payload['namespace']).to eq ''
  #         expect(@envelopes.first.payload['groups']).to eq %w(cg dk1)
  #       end
  #     end
  #   end
  #
  #   it 'lists all cg in namespace' do
  #     VCR.use_cassette('integration/channel_registration/list-all-cg-in-ns', :record => :once) do
  #       pubnub_client.channel_registration(action: :get, group: 'foo:', http_sync: false, callback: callback)
  #       eventually do
  #         expect(@envelopes.first.status).to eq 200
  #         expect(@envelopes.first.payload['namespace']).to eq 'foo'
  #         expect(@envelopes.first.payload['groups']).to eq %w(foo new_group)
  #       end
  #     end
  #   end
  #
  #   it 'lists all channels in namespaced cg' do
  #     VCR.use_cassette('integration/channel_registration/list-all-c-in-in-ns-cg', :record => :once) do
  #       pubnub_client.channel_registration(action: :get, group: 'foo:foo', http_sync: false, callback: callback)
  #       eventually do
  #         expect(@envelopes.first.status).to eq 200
  #         expect(@envelopes.first.payload['group']).to eq 'foo'
  #         expect(@envelopes.first.payload['channels']).to eq %w(aaa bbb)
  #       end
  #     end
  #   end
  #
  #   it 'lists all channels in non-namespaced cg' do
  #     VCR.use_cassette('integration/channel_registration/list-all-c-in-non-ns-cg', :record => :once) do
  #       pubnub_client.channel_registration(action: :get, group: ':cg', http_sync: false, callback: callback)
  #       eventually do
  #         expect(@envelopes.first.status).to eq 200
  #         expect(@envelopes.first.payload['group']).to eq 'cg'
  #         expect(@envelopes.first.payload['channels']).to eq %w(ping_3 x z)
  #       end
  #     end
  #   end
  #
  #   context 'adding channel to cg' do
  #     it 'adds channel to cg if given channel symbol' do
  #       VCR.use_cassette('integration/channel_registration/add-c-as-symbol', :record => :once) do
  #         pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: :one, http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'adds channel to cg if given channel array' do
  #       VCR.use_cassette('integration/channel_registration/add-c-as-array', :record => :once) do
  #         pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: %w(one two), http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'adds channel to cg if given channel string' do
  #       VCR.use_cassette('integration/channel_registration/add-c-as-string', :record => :once) do
  #         pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: 'one', http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'adds channel to cg if given channel csv' do
  #       VCR.use_cassette('integration/channel_registration/add-c-as-csv', :record => :once) do
  #         pubnub_client.channel_registration(action: :add, group: 'foo:foo', channel: 'one,two', http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #   end
  #
  #   context 'removing channel from cg' do
  #     it 'removes channel from cg if given channel symbol' do
  #       VCR.use_cassette('integration/channel_registration/remove-c-as-symbol', :record => :once) do
  #         pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: :one, http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'removes channel from cg if given channel array' do
  #       VCR.use_cassette('integration/channel_registration/remove-c-as-array', :record => :once) do
  #         pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: %w(one two), http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'removes channel from cg if given channel string' do
  #       VCR.use_cassette('integration/channel_registration/remove-c-as-string', :record => :once) do
  #         pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: 'one', http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'removes channel from cg if given channel csv' do
  #       VCR.use_cassette('integration/channel_registration/remove-c-as-csv', :record => :once) do
  #         pubnub_client.channel_registration(action: :remove, group: 'foo:foo', channel: 'one,two', http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'removes cg from ns' do
  #       VCR.use_cassette('integration/channel_registration/remove-cg-from-ns-csv', :record => :once) do
  #         pubnub_client.channel_registration(action: :remove, group: 'foo:foo', http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #
  #     it 'removes ns' do
  #       VCR.use_cassette('integration/channel_registration/remove-ns-csv', :record => :once) do
  #         pubnub_client.channel_registration(action: :remove, group: 'foo:', http_sync: false, callback: callback)
  #         eventually do
  #           expect(@envelopes.first.status).to eq 200
  #           expect(@envelopes.first.message).to eq 'OK'
  #           expect(@envelopes.first.error).to eq false
  #         end
  #       end
  #     end
  #   end
  # end
end