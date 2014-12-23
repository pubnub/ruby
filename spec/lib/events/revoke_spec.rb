require 'spec_helper'

describe Pubnub::Revoke do
  it_behaves_like 'an event'

  around(:each) do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end
end