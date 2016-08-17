require 'spec_helper'

describe 'Client#paged_history' do

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

    @pn = Pubnub.new(:max_retries => 0, :subscribe_key => :demo, :publish_key => :demo, :auth_key => :demoish_authkey, :secret_key => 'some_secret_key', :error_callback => @error_callback)
    @pn.uuid = 'rubytests'

  end

  context 'uses ssl' do
    context 'sync' do
      it 'works with basic usage' do
        VCR.use_cassette("paged-history-ssl-sync", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => true, :channel => :bot, :callback => @callback)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end
      end

      it 'works with given start' do
        VCR.use_cassette("paged-history-start-ssl-sync", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => true, :channel => :bot, :callback => @callback, :start => 14319447984449246)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end
      end

      it 'works with given pages' do
        VCR.use_cassette("paged-history-pages-ssl-sync", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => true, :channel => :bot, :callback => @callback, :page => 3)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages and start' do
        VCR.use_cassette("paged-history-pages-start-ssl-sync", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => true, :channel => :bot, :callback => @callback, :start => 14319447984449246, :page => 2)
        end


      end
    end

    context 'async' do
      it 'works with basic usage' do
        VCR.use_cassette("paged-history-ssl-async", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => false, :channel => :bot, :callback => @callback)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end

      end

      it 'works with given start' do
        VCR.use_cassette("paged-history-start-ssl-async", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => false, :channel => :bot, :callback => @callback, :start => 14319447984449246)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages' do
        VCR.use_cassette("paged-history-pages-ssl-async", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => false, :channel => :bot, :callback => @callback, :page => 3)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages and start' do
        VCR.use_cassette("paged-history-pages-start-ssl-async", :record => :once) do
          @pn.paged_history(:ssl => true, :http_sync => false, :channel => :bot, :callback => @callback, :start => 14319447984449246, :page => 2)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end
    end
  end

  context 'uses non-ssl' do
    context 'sync' do
      it 'works with basic usage' do
        VCR.use_cassette("paged-history-sync", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => true, :channel => :bot, :callback => @callback)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end

      end

      it 'works with given start' do
        VCR.use_cassette("paged-history-start-sync", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => true, :channel => :bot, :callback => @callback, :start => 14319447984449246)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages' do
        VCR.use_cassette("paged-history-pages-sync", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => true, :channel => :bot, :callback => @callback, :page => 3)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages and start' do
        VCR.use_cassette("paged-history-pages-start-sync", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => true, :channel => :bot, :callback => @callback, :start => 14319447984449246, :page => 2)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end
    end

    context 'async' do
      it 'works with basic usage' do
        VCR.use_cassette("paged-history-async", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => false, :channel => :bot, :callback => @callback)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end

      end

      it 'works with given start' do
        VCR.use_cassette("paged-history-start-async", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => false, :channel => :bot, :callback => @callback, :start => 14319447984449246)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages' do
        VCR.use_cassette("paged-history-pages-async", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => false, :channel => :bot, :callback => @callback, :page => 3)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end


      end

      it 'works with given pages and start' do
        VCR.use_cassette("paged-history-pages-start-async", :record => :once) do
          @pn.paged_history(:ssl => false, :http_sync => false, :channel => :bot, :callback => @callback, :start => 14319447984449246, :page => 2)

          eventually do
            @after_callback.should eq true
            @response_output.seek 0
            @response_output.read.should eq '[["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237][["****........... 7887 - 2015-05-18 04:52:57","*****.......... 7888 - 2015-05-18 04:52:59"],14319499779635079,14319501800508237]'
            @message_output.seek 0
            @message_output.read.should eq '****........... 7887 - 2015-05-18 04:52:57*****.......... 7888 - 2015-05-18 04:52:59'
          end
        end

      end
    end
  end
end