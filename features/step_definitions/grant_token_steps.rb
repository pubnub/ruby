require 'pubnub'

token_with_all = "qEF2AkF0GmEI03xDdHRsGDxDcmVzpURjaGFuoWljaGFubmVsLTEY70NncnChb2NoYW5uZWxfZ3JvdXAtMQVDdXNyoENzcGOgRHV1aWShZnV1aWQtMRhoQ3BhdKVEY2hhbqFtXmNoYW5uZWwtXFMqJBjvQ2dycKF0XjpjaGFubmVsX2dyb3VwLVxTKiQFQ3VzcqBDc3BjoER1dWlkoWpedXVpZC1cUyokGGhEbWV0YaBEdXVpZHR0ZXN0LWF1dGhvcml6ZWQtdXVpZENzaWdYIPpU-vCe9rkpYs87YUrFNWkyNq8CVvmKwEjVinnDrJJc"

Given('I have a keyset with access manager enabled') do
  expect(ENV['PAM_SUB_KEY']).not_to be_nil
  expect(ENV['PAM_PUB_KEY']).not_to be_nil
  expect(ENV['PAM_SEC_KEY']).not_to be_nil
  @pn_configuration['subscribe_key'] = ENV['PAM_SUB_KEY']
  @pn_configuration['publish_key'] = ENV['PAM_PUB_KEY']
  @pn_configuration['secret_key'] = ENV['PAM_SEC_KEY']
  logger = Logger.new(STDOUT)
  logger.level = Logger::DEBUG
  @pn_configuration['logger'] = logger

  @pubnub = Pubnub.new(@pn_configuration)
end

Given('the authorized UUID {string}') do |uuid|
  @grant_token_state[:authorized_uuid] = uuid
end

Given('the TTL {int}') do |ttl|
  @grant_token_state[:ttl] = ttl
end

Given('the {string} {resourceType} resource access permissions') do |name, resource_type|
  @grant_token_state[:current_name] = name

  @grant_token_state[:current_grant][name] = {
    :name => name,
    :resource_type => resource_type,
    :permission_type => []
  }
end

And('grant resource permission {permissionType}') do |permission_type|
  current_name = @grant_token_state[:current_name]
  @grant_token_state[:current_grant][current_name][:permission_type].push(permission_type)
end

Given('the {string} {resourceType} pattern access permissions') do |pattern, resource_type|
  @grant_token_state[:current_pattern] = pattern
  @grant_token_state[:current_grant][pattern] = {
    :pattern => pattern,
    :resource_type => resource_type,
    :permission_type => []
  }
end

And('grant pattern permission {permissionType}') do |permission_type|
  current_pattern = @grant_token_state[:current_pattern]
  @grant_token_state[:current_grant][current_pattern][:permission_type].push(permission_type)
end


When('I grant a token specifying those permissions') do
  res = call_grant_token(@pubnub, @grant_token_state)
  @grant_token_state[:parsed_token] = Pubnub::GrantToken.parse_token(res.result[:data]["token"])
end

Then('the token contains the authorized UUID {string}') do |expected_uuid|
  expect(@grant_token_state[:parsed_token]["uuid"]).to eq expected_uuid
end

Then('the token contains the TTL {int}') do |ttl|
  expect(@grant_token_state[:parsed_token]["ttl"]).to eq ttl
end

Then('the token has {string} {resourceType} resource access permissions') do |resource, resource_type|
  case resource_type
  when "CHANNEL"
    @grant_token_state[:token_resource] = @grant_token_state[:parsed_token]["res"]["chan"][resource]
  when "CHANNEL_GROUP"
    @grant_token_state[:token_resource] = @grant_token_state[:parsed_token]["res"]["grp"][resource]
  when "UUID"
    @grant_token_state[:token_resource] = @grant_token_state[:parsed_token]["res"]["uuid"][resource]
  else
    fail
  end

  expect(@grant_token_state[:token_resource]).not_to eq nil
end

Then('token resource permission {permissionType}') do |permission_type|
  expect(has_permission(@grant_token_state[:token_resource], permission_type)).to eq true
end

Then('the token has {string} {resourceType} pattern access permissions') do |pattern, resourceType|
  case resourceType
  when "CHANNEL"
    @grant_token_state[:token_resource] = @grant_token_state[:parsed_token]["pat"]["chan"][pattern]
  when "CHANNEL_GROUP"
    @grant_token_state[:token_resource] = @grant_token_state[:parsed_token]["pat"]["grp"][pattern]
  when "UUID"
    @grant_token_state[:token_resource] = @grant_token_state[:parsed_token]["pat"]["uuid"][pattern]
  else
    fail
  end

  expect(@grant_token_state[:token_resource]).not_to eq nil
end

And('token pattern permission {permissionType}') do |permission_type|
  expect(has_permission(@grant_token_state[:token_resource], permission_type)).to eq true
end

Then('the token does not contain an authorized uuid') do
  expect(@grant_token_state[:parsed_token]["uuid"]).to eq nil
end

Given('deny resource permission {permissionType}') do |permission_type|
  current_name = @grant_token_state[:current_name]
  @grant_token_state[:current_grant][current_name][:permission_type].filter { |p| p != permission_type }
end

When('I attempt to grant a token specifying those permissions') do
  @grant_token_state[:error_response] = call_grant_token(@pubnub, @grant_token_state)
end

Then('an error is returned') do
  expect(@grant_token_state[:error_response]).not_to eq nil
end

Then('the error status code is {int}') do |code|
  expect(@grant_token_state[:error_response].result[:code]).to eq code
end

Then('the error message is {string}') do |error_message|
  expect(parse_error_body(@grant_token_state[:error_response])["error"]["message"]).to eq error_message
end

Then('the error source is {string}') do |error_source|
  expect(parse_error_body(@grant_token_state[:error_response])["error"]["source"]).to eq error_source
end

Then('the error detail message is {string}') do |details_message|
  expect(parse_error_body(@grant_token_state[:error_response])["error"]["details"][0]["message"]).to eq details_message
end

Then('the error detail location is {string}') do |details_location|
  expect(parse_error_body(@grant_token_state[:error_response])["error"]["details"][0]["location"]).to eq details_location
end

Then('the error detail location type is {string}') do |location_type|
  expect(parse_error_body(@grant_token_state[:error_response])["error"]["details"][0]["locationType"]).to eq location_type
end

Given('I have a known token containing an authorized UUID') do
  @grant_token_state[:token] = token_with_all
end

When('I parse the token') do
  @grant_token_state[:parsed_token] = Pubnub::GrantToken.parse_token(@grant_token_state[:token])
end

Then('the parsed token output contains the authorized UUID {string}') do |expected_uuid|
  expect(@grant_token_state[:parsed_token]["uuid"]).to eq expected_uuid
end

Given('I have a known token containing UUID resource permissions') do
  @grant_token_state[:token] = token_with_all
end

Given('I have a known token containing UUID pattern Permissions') do
  @grant_token_state[:token] = token_with_all
end
