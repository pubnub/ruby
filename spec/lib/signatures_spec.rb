require 'spec_helper'

describe 'Signatures' do

  around :each do |example|
    example.run
  end

  it 'works all letters channel' do
    stub_const('Pubnub::VERSION', '4.0.21')
    Pubnub::Grant.any_instance.stub(:current_time).and_return(1496242823)

    pubnub = Pubnub.new(
        subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
        publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
        secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
        uuid: 'test'
    )

    VCR.use_cassette('lib/signatures/all-letters', record: :once) do
      envelope = pubnub.grant(channel: 'demo', http_sync: true)
      expect(envelope.status[:code]).to eq 200
    end
  end

  it 'works with wildcard' do
    stub_const('Pubnub::VERSION', '4.0.21')
    Pubnub::Grant.any_instance.stub(:current_time).and_return(1496242823)

    pubnub = Pubnub.new(
        subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
        publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
        secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
        uuid: 'test'
    )

    VCR.use_cassette('lib/signatures/wildcard', record: :once) do
      envelope = pubnub.grant(channel: 'demo.*', http_sync: true)
      expect(envelope.status[:code]).to eq 200
    end
  end

  context 'with various special characters' do
    it 'grant works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::Grant.any_instance.stub(:current_time).and_return(1496242824)

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/special', record: :once) do
        envelope = pubnub.grant(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.status[:code]).to eq 200
      end
    end

    it 'publish works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::Publish.any_instance.stub(:current_time).and_return 1496396127
      Pubnub::Client.any_instance.stub(:generate_ortt).and_return 14963961271418600

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/publish', record: :once) do
        envelope = pubnub.publish(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', message: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.status[:code]).to eq 200
      end
    end

    it 'subscribe works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::Subscribe.any_instance.stub(:current_time).and_return 1496397558

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/subscribe', record: :once) do
        envelope = pubnub.subscribe(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.first.status[:code]).to eq 200
      end
    end

    it 'presence works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::Presence.any_instance.stub(:current_time).and_return 1496401532

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/presence', record: :once) do
        envelope = pubnub.presence(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.first.status[:code]).to eq 200
      end
    end

    it 'leave works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::Leave.any_instance.stub(:current_time).and_return 1496401409

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/leave', record: :once) do
        envelope = pubnub.leave(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.status[:code]).to eq 200
      end
    end

    it 'history works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::History.any_instance.stub(:current_time).and_return 1496396745

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/history', record: :once) do
        envelope = pubnub.history(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.status[:code]).to eq 200
      end
    end

    it 'here-now works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::HereNow.any_instance.stub(:current_time).and_return 1496401140

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/here_now', record: :once) do
        envelope = pubnub.here_now(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(envelope.status[:code]).to eq 200
      end
    end

    it 'channel registration works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/channel_registration', record: :once) do
        Pubnub::ChannelRegistration.any_instance.stub(:current_time).and_return 1496400706
        envelope0 = pubnub.channel_registration(
            action: :add,
            channel: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            channel_group: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            http_sync: true
        )

        Pubnub::ChannelRegistration.any_instance.stub(:current_time).and_return 1496400706
        envelope1 = pubnub.channel_registration(
            action: :get,
            channel_group: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            http_sync: true
        )

        Pubnub::ChannelRegistration.any_instance.stub(:current_time).and_return 1496400706
        envelope2 = pubnub.channel_registration(
            action: :remove,
            channel: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            channel_group: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            http_sync: true
        )

        Pubnub::ChannelRegistration.any_instance.stub(:current_time).and_return 1496400706
        envelope3 = pubnub.channel_registration(
            action: :remove,
            channel_group: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            http_sync: true
        )

        expect(envelope0.status[:code]).to eq 200
        expect(envelope1.status[:code]).to eq 200
        expect(envelope2.status[:code]).to eq 200
        expect(envelope3.status[:code]).to eq 200
      end
    end

    it 'heartbeat works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::Heartbeat.any_instance.stub(:current_time).and_return 1496400995

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/heartbeat', record: :once) do
        envelope = pubnub.heartbeat(channel: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z', heartbeat: 10, http_sync: true)
        expect(envelope.status[:code]).to eq 200
      end
    end

    it 'state works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::SetState.any_instance.stub(:current_time).and_return 1496402248
      Pubnub::State.any_instance.stub(:current_time).and_return 1496402248

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z'
      )

      VCR.use_cassette('lib/signatures/state', record: :once) do
        envelope = pubnub.set_state(
            channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z',
            state: { something: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z' },
            http_sync: true
        )

        expect(envelope.status[:code]).to eq 200

        next_envelope = pubnub.get_state(channel: 'a!@#$%^&*()ŻÓŁ[]{}""<>??~`Z', uuid: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z', http_sync: true)
        expect(next_envelope.status[:code]).to eq 200
      end
    end

    it 'where now works' do
      stub_const('Pubnub::VERSION', '4.0.21')
      Pubnub::WhereNow.any_instance.stub(:current_time).and_return 1496402114

      pubnub = Pubnub.new(
          subscribe_key: 'sub-c-b6df3d38-45e3-11e7-86e2-02ee2ddab7fe',
          publish_key: 'pub-c-cd48c41a-afce-4f37-8b3b-7fafccf52e2d',
          secret_key: 'sec-c-OTMzNmViNGEtYjg0MS00ZTZkLWI5ZmMtNDYzMDA0NTBlMDdi',
          uuid: 'test'
      )

      VCR.use_cassette('lib/signatures/where_now', record: :once) do
        envelope = pubnub.where_now(
            uuid: 'a!@#$%^&()ŻÓŁ[]{}""<>??~`Z',
            http_sync: true
        )

        expect(envelope.status[:code]).to eq 200
      end
    end
  end
end
