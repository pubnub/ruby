require 'spec_helper'

describe '#where_now' do
  before(:each) do
    EM.stop if EM.reactor_running?
    while EM.reactor_running? do end
    sleep(0.1)

    @response_output = StringIO.new
    @message_output = StringIO.new

    @callback = lambda { |envelope|
      Pubnub.logger.debug 'FIRING CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_callback = true
    }

    @error_callback = lambda { |envelope|
      Pubnub.logger.debug 'FIRING ERROR CALLBACK FROM TEST'
      @response_output.write envelope.response
      @message_output.write envelope.msg
      @after_error_callback = true
    }

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :ds, :publish_key => :ds, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'
  end
  context 'https' do
    before :each do
      @ssl = true
    end
    it 'receives message sent to foo.bar when subscribed on foo.*' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-1", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*', :callback => @callback)

        eventually do
          @after_callback.should eq true
          @response_output.seek 0
          @response_output.read.should eq "[[{\"text\":\"hey\"}],\"14376641318913945\",\"foo.*\",\"foo.foo\"]"
          @message_output.seek 0
          @message_output.read.should eq "{\"text\"=>\"hey\"}"
        end
      end
    end

    it 'is able to subscribe on foo.* and receive presence events on foo.bar-pnpress when presence callback is provided.' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-2", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*', :callback => @callback, :presence_callback => @callback)

        eventually do
          @after_callback.should eq true
          @response_output.seek 0
          @response_output.read.should eq "[[{\"action\": \"leave\", \"timestamp\": 1437664166, \"uuid\": \"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\": 0}],\"14376641662543427\",\"foo.*\",\"foo.foo-pnpres\"]"
          @message_output.seek 0
          @message_output.read.should eq "{\"action\"=>\"leave\", \"timestamp\"=>1437664166, \"uuid\"=>\"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\"=>0}"
        end
      end
    end

    it 'does not receive presence events when subscribed to foo.* when presence callback is not provided.' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-3", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*', :callback => @callback)

        eventually do
          @after_callback.should eq nil
          @response_output.seek 0
          @response_output.read.should eq ''
          @message_output.seek 0
          @message_output.read.should eq ''
        end
      end
    end

    it 'is able to bo subscribed to non-WC channel, channel group and wildcard channel at same time using multiplexing and should receive messages appropriately when message is published on corresponding channel' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-4", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*,foo', :group => 'group', :callback => @callback, :presence_callback => @callback)

        eventually do
          @after_callback.should eq true
          @response_output.seek 0
          @response_output.read.should eq "[[{\"text\":\"hey\"}],\"14376642242988715\",\"foo.*\",\"foo.foo\"][[{\"action\": \"leave\", \"timestamp\": 1437664227, \"uuid\": \"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\": 0}],\"14376642278720422\",\"foo.*\",\"foo.foo-pnpres\"][[{\"text\":\"hey\"}],\"14376642302336303\",\"foo\",\"foo\"]"
          @message_output.seek 0
          @message_output.read.should eq "{\"text\"=>\"hey\"}{\"action\"=>\"leave\", \"timestamp\"=>1437664227, \"uuid\"=>\"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\"=>0}{\"text\"=>\"hey\"}"
        end
      end
    end
  end

  context 'https' do
    before :each do
      @ssl = false
    end
    it 'receives message sent to foo.bar when subscribed on foo.*' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-1", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*', :callback => @callback)

        eventually do
          @after_callback.should eq true
          @response_output.seek 0
          @response_output.read.should eq "[[{\"text\":\"hey\"}],\"14376641318913945\",\"foo.*\",\"foo.foo\"]"
          @message_output.seek 0
          @message_output.read.should eq "{\"text\"=>\"hey\"}"
        end
      end
    end

    it 'is able to subscribe on foo.* and receive presence events on foo.bar-pnpress when presence callback is provided.' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-2", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*', :callback => @callback, :presence_callback => @callback)

        eventually do
          @after_callback.should eq true
          @response_output.seek 0
          @response_output.read.should eq "[[{\"action\": \"leave\", \"timestamp\": 1437664166, \"uuid\": \"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\": 0}],\"14376641662543427\",\"foo.*\",\"foo.foo-pnpres\"]"
          @message_output.seek 0
          @message_output.read.should eq "{\"action\"=>\"leave\", \"timestamp\"=>1437664166, \"uuid\"=>\"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\"=>0}"
        end
      end
    end

    it 'does not receive presence events when subscribed to foo.* when presence callback is not provided.' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-3", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*', :callback => @callback)

        eventually do
          @after_callback.should eq nil
          @response_output.seek 0
          @response_output.read.should eq ''
          @message_output.seek 0
          @message_output.read.should eq ''
        end
      end
    end

    it 'is able to bo subscribed to non-WC channel, channel group and wildcard channel at same time using multiplexing and should receive messages appropriately when message is published on corresponding channel' do
      VCR.use_cassette("wc-sub-ssl-#{@ssl}-4", :record => :once) do
        @pn.subscribe(:ssl => @ssl, :channel => 'foo.*,foo', :group => 'group', :callback => @callback, :presence_callback => @callback)

        eventually do
          @after_callback.should eq true
          @response_output.seek 0
          @response_output.read.should eq "[[{\"text\":\"hey\"}],\"14376642242988715\",\"foo.*\",\"foo.foo\"][[{\"action\": \"leave\", \"timestamp\": 1437664227, \"uuid\": \"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\": 0}],\"14376642278720422\",\"foo.*\",\"foo.foo-pnpres\"][[{\"text\":\"hey\"}],\"14376642302336303\",\"foo\",\"foo\"]"
          @message_output.seek 0
          @message_output.read.should eq "{\"text\"=>\"hey\"}{\"action\"=>\"leave\", \"timestamp\"=>1437664227, \"uuid\"=>\"c7769435-68b3-48b0-9065-08cafce285df\", \"occupancy\"=>0}{\"text\"=>\"hey\"}"
        end
      end
    end
  end
end
