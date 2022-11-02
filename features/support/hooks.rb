require 'net/http'
require 'json'

Before do |scenario|
  @grant_token_state = {}
  @global_state = {}
  @grant_token_state[:current_grant] = {}
  @pn_configuration = {}

  when_mock_server_used {
    puts "Using mock"
    expect(ENV['SERVER_HOST']).not_to be_nil
    expect(ENV['SERVER_PORT']).not_to be_nil
    @pn_configuration = {
      origin: ENV['SERVER_HOST'] + ":" + ENV['SERVER_PORT'],
      isSecure: false,
    }
  }

  when_mock_server_used {
    init_mock(scenario)
  }
end

After do |scenario|
  when_mock_server_used {
    expect_mock(scenario)
  }
end

def when_mock_server_used(&block)
  if ENV['SERVER_MOCK']&.to_s&.downcase == 'true'
    block.call
  end
end

def init_mock(scenario)
  contract_name = contract_name(scenario)
  if contract_name
    call_init_endpoint(contract_name)
  end
end

def call_init_endpoint(contract_name)
  Net::HTTP.get_response("#{ENV['SERVER_HOST']}", "/init?__contract__script__=#{contract_name}", "#{ENV['SERVER_PORT']}")
end

def expect_mock(scenario)
  contract_name = contract_name(scenario)
  if contract_name
    expect_result = call_expect_endpoint()
    print(expect_result)
    if still_pending?(expect_result) || some_failed?(expect_result)
      message = "Scenario #{extract_contract(expect_result)} considered failure:
pending - #{extract_pending(expect_result)},
failed - #{extract_failed(expect_result)}"
      RSpec::Expectations.fail_with(message)
    end
  end
end

def extract_contract(expect_result)
  expect_result['contract']
end

def extract_pending(expect_result)
  expect_result['expectations']['pending'].join(", ")
end

def extract_failed(expect_result)
  expect_result['expectations']['failed'].join(", ")
end

def still_pending?(expect_result)
  pending = expect_result['expectations']['pending']
  not pending.empty?
end

def some_failed?(expect_result)
  pending = expect_result['expectations']['failed']
  not pending.empty?
end

def call_expect_endpoint
  expect_response = Net::HTTP.get_response("#{ENV['SERVER_HOST']}", "/expect", "#{ENV['SERVER_PORT']}")

  if expect_response == nil || expect_response.body == nil
    RSpec::Expectations.fail_with("Expect response body is null")
  else
    JSON.parse(expect_response.body)
  end
end

def contract_name(scenario)
  scenario.source_tag_names&.
    select { |tagName| tagName.start_with?("@contract") }&.
    map { |tagName| tagName.split("=")[1] }&.first
end