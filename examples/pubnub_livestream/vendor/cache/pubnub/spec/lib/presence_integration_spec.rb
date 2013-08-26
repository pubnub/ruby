require 'spec_helper'
require 'rr'
require 'stringio'
require 'webmock/rspec'

describe '#presence' do
  before do
    @output = StringIO.new
    @callback = lambda { |envelope|
      @autput.write envelope.response
      EM.stop if EM.reactor_running?
    }
    @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo)
    @pn.session_uuid = nil
  end

  context '' do
    
  end
