require 'spec_helper'

describe 'Pubnub::Formatter' do
  before(:each) do
    @formater = (Class.new { include Pubnub::Formatter }).new
  end

  context '#format_channels' do
    context 'should encode' do
      it 'encodes properly string into array of channels' do
        encoded = @formater.format_channels('Some Channel with+special+chars=[];!@#$%^&*()')
        encoded.should eq ['Some%20Channel%20with%2Bspecial%2Bchars%3D%5B%5D%3B%21%40%23%24%25%5E%26*%28%29']
      end

      it 'encodes properly array of strings into array of channels' do
        encoded = @formater.format_channels(['Some Channel with+special+chars=[];!@#$%^&*()', ' +++ ', '123'])
        encoded.should eq ['Some%20Channel%20with%2Bspecial%2Bchars%3D%5B%5D%3B%21%40%23%24%25%5E%26*%28%29', '%20%2B%2B%2B%20', '123']
      end

      it 'encodes properly csv into array of channels' do
        encoded = @formater.format_channels('Some Channel with+special+chars=[];!@#$%^&*(), +++ ,123')
        encoded.should eq ['Some%20Channel%20with%2Bspecial%2Bchars%3D%5B%5D%3B%21%40%23%24%25%5E%26*%28%29', '%20%2B%2B%2B%20', '123']
      end
    end

    context 'should not encode' do
      it 'formats properly string into array of channels' do
        encoded = @formater.format_channels('Some Channel with+special+chars=[];!@#$%^&*()', false)
        encoded.should eq ['Some Channel with+special+chars=[];!@#$%^&*()']
      end

      it 'formats properly array of strings into array of channels' do
        encoded = @formater.format_channels(['Some Channel with+special+chars=[];!@#$%^&*()', ' +++ ', '123'], false)
        encoded.should eq ['Some Channel with+special+chars=[];!@#$%^&*()', ' +++ ', '123']
      end

      it 'formats properly csv into array of channels' do
        encoded = @formater.format_channels('Some Channel with+special+chars=[];!@#$%^&*(), +++ ,123', false)
        encoded.should eq ['Some Channel with+special+chars=[];!@#$%^&*()', ' +++ ', '123']
      end
    end
  end

  context '#encode_channel' do
    it 'encodes channel' do
      encoded = @formater.encode_channel('Some Channel with+special+chars=[];!@#$%^&*()')
      encoded.should eq 'Some%20Channel%20with%2Bspecial%2Bchars%3D%5B%5D%3B%21%40%23%24%25%5E%26*%28%29'
    end

    it 'encodes channel with colon' do
      encoded = @formater.encode_channel('test1:test2')
      encoded.should eq 'test1%3Atest2'
    end

  end

end
