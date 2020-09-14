require "spec_helper"

describe "formatter" do
  around :each do |example|
    example.run_with_retry retry: 10
  end

  it "does not hide errors when formatting" do
    class MockFormatter
      include Pubnub::SubscribeEvent::Formatter
    end

    class TestError < StandardError
      def message
        "This is a test"
      end
    end

    # ensure the correct error is raised instead of -> NoMethodError: undefined method `body'
    expect { MockFormatter.new.send(:format_envelopes, TestError.new('error'), nil) }.to raise_error(TestError)
  end
end