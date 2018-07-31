require "spec_helper"

describe Pubnub::UUID do
  it "generates valid UUID" do
    expect(Pubnub::UUID.generate).to match(
      /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}
      -[0-9a-f]{12}$/x
    )
  end
end
