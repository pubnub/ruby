require 'spec_helper'

describe 'keep_alive connection' do

  around :each do |example|
    Celluloid.boot
    example.run
    Celluloid.shutdown
  end

  it ''

end
