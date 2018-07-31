require "rspec/expectations"

RSpec::Matchers.define :satisfies_schema do |expected|
  match do |actual|
    @check = expected.call actual
    @check.success?
  end

  failure_message do |actual|
    msg = "expected that given hash will fit the schema.\n"
    msg + @check.messages.map { |k, v| "#{k}: #{v}" }.join("\n")
  end
end
