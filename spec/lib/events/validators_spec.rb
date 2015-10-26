require 'spec_helper'

describe Pubnub::Validator::Publish do

  around(:each) do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it 'validates presence of publish key' do
    p = Pubnub.new(subscribe_key: :demo)
    expect { p.publish(channel: :demo, message: :whatever, http_sync: true) }.to raise_error(Pubnub::ArgumentError)
  end

  it 'validates presence of message' do
    p = Pubnub.new(subscribe_key: :demo, publish_key: :demo)
    expect { p.publish(channel: :demo, http_sync: true) }.to raise_error(Pubnub::ArgumentError)
  end

  it 'validates presence of channel' do
    p = Pubnub.new(subscribe_key: :demo, publish_key: :demo)
    expect { p.publish(message: :whatever, http_sync: true) }.to raise_error(Pubnub::ArgumentError)
  end
end
