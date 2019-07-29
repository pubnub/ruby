require "rspec/expectations"

RSpec::Matchers.define :satisfies_schema do |expected|
  match do |actual|
    @check = expected.call actual
    @check.success?
  end

  failure_message do |actual|
    msg = "expected that given hash will fit the schema.\n"
        
    @check.errors.each do |item|
      item.path.each do |path|
        msg += "#{path}."
      end

      msg = msg.delete_suffix(".")

      msg += ": #{item.text}\n"
    end

    return msg
  end
end
