require "spec_helper"

describe "keep_alive connection" do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  it ""
end
