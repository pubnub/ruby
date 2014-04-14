require 'spec_helper'

# If VCR would fail, that means auth_key isn't set as desired in params
describe 'auth_key flow' do

  before(:each) do
    origin = 'pubsub.pubnub.com'
    sub_key = 'sub-c-a478dd2a-c33d-11e2-883f-02ee2ddab7fe'
    pub_key = 'pub-c-a2650a22-deb1-44f5-aa87-1517049411d5'
    sec_key = 'sec-c-YjFmNzYzMGMtYmI3NC00NzJkLTlkYzYtY2MwMzI4YTJhNDVh'
    @pn = Pubnub.new(:subscribe_key => sub_key, :publish_key => pub_key, :secret_key => sec_key, :error_callback => lambda {|e|})

    Pubnub::Audit.any_instance.stub(:current_time).and_return 1234567890
    Pubnub::Audit.any_instance.stub(:signature).and_return 'kdDh/sFC3rSR%2Bt5AEymIc57d1velIr562V7usa5M4k0='
  end

  context 'non-pam' do
    it 'isn\'t appened to params if isn\'t set' do
      VCR.use_cassette("auth_key_flow_no_auth_publish", :record => :none) do
        enve = @pn.publish(:channel => :ruby_test, :http_sync => true, :message => :whatever)
        enve.size.should eq 1
      end
    end

    it 'appears in params if set' do
      VCR.use_cassette("auth_key_flow_auth_publish", :record => :none) do
        @pn.auth_key = 'ruby_client_123'
        enve = @pn.publish(:channel => :ruby_test, :http_sync => true, :message => :whatever)
        enve.size.should eq 1
      end
    end
  end
  
  context 'PAM' do
    it 'doesn\'t care if it\'s set in client' do
      VCR.use_cassette("auth_key_flow_non_auth_audit", :record => :none) do
        @pn.auth_key = 'ruby_client_123'
        enve = @pn.audit(:channel => :ruby_test, :http_sync => true)
        enve.size.should eq 1
      end
    end

    it 'uses passed auth_key insted of client auth_key' do
      VCR.use_cassette("auth_key_flow_instead_auth_audit", :record => :none) do
        @pn.auth_key = 'ruby_client_123'
        enve = @pn.audit(:channel => :ruby_test, :http_sync => true, :auth_key => 'omg_so_key')
        enve.size.should eq 1
      end
    end

    it 'uses passed auth_key when client auth_key is blank' do
      VCR.use_cassette("auth_key_flow_empty_auth_audit", :record => :none) do
        enve = @pn.audit(:channel => :ruby_test, :http_sync => true, :auth_key => 'omg_so_key')
        enve.size.should eq 1
      end
    end
  end

end

