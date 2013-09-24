describe '#publish' do
  before do
    @output = StringIO.new
    @callback = lambda { |envelope|
      @output.write envelope.response
      @after_callback = true
    }
    @error_callback = lambda { |envelope|
      @output.write envelope.response
      @after_callback = true
    }
    @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo, :error_callback => @error_callback)
    @pn.session_uuid = nil
  end

  before(:each) do
    @after_callback = false
  end



end