# frozen_string_literal: true
require 'pubnub'

Given(/^Crypto module with '([^']*)' cryptor$/) do |cryptor_id|
  @cryptor_ids = [cryptor_id]
end

Given(/^Crypto module with default '([^']*)' and additional '([^']*)' cryptors$/) do |cryptor_id1, cryptor_id2|
  @cryptor_ids = [cryptor_id1, cryptor_id2]
end

Given(/^Legacy code with '([^']*)' cipher key and '(random|constant|-)' vector$/) do |cipher_key, use_random_iv|
  use_random_iv = use_random_iv != 'constant'
  @legacy_cryptor = Cryptor.new cipher_key, use_random_iv
end

Then(/^with '([^']*)' cipher key$/) do |cipher_key|
  @cipher_key = cipher_key
end

Then(/^with '(random|constant|-)' vector$/) do |use_random_iv|
  @use_random_iv = use_random_iv != 'constant'
end

When(/^I encrypt '([^']*)' file as '([^']*)'$/) do |file_name, type|
  @source_file_name = file_name
  @source_file_content = File.binread "sdk-specifications/features/encryption/assets/#{file_name}"
  @encrypted_content = crypto_module.encrypt @source_file_content
  expect(@encrypted_content).not_to eq nil
end

When(/^I decrypt '([^']*)' file$/) do |file_name|
  file_content = File.binread "sdk-specifications/features/encryption/assets/#{file_name}"

  begin
    @decrypted_content = crypto_module.decrypt file_content
  rescue Pubnub::UnknownCryptorError
    @decrypt_status = 'unknown cryptor error'
  end
  @decrypt_status = 'decryption error' if @decrypted_content.nil? && @decrypt_status.nil?
  @decrypt_status = 'success' if !@decrypted_content.nil? && @decrypt_status.nil?
end

When(/^I decrypt '([^']*)' file as '([^']*)'$/) do |file_name, _|
  file_content = File.binread "sdk-specifications/features/encryption/assets/#{file_name}"

  begin
    @decrypted_content = crypto_module.decrypt file_content
  rescue Pubnub::UnknownCryptorError
    @decrypt_status = 'unknown cryptor error'
  end
  @decrypt_status = 'decryption error' if @decrypted_content.nil? && @decrypt_status.nil?
  @decrypt_status = 'success' if !@decrypted_content.nil? && @decrypt_status.nil?
end

Then(/^Decrypted file content equal to the '([^']*)' file content$/) do |file_name|
  file_content = File.binread "sdk-specifications/features/encryption/assets/#{file_name}"
  expect(@decrypted_content).not_to eq nil
  expect(@decrypted_content).to eq file_content
end

Then('Successfully decrypt an encrypted file with legacy code') do
  expect(@legacy_cryptor).not_to eq nil
  base64_encoded = Base64.strict_encode64(@encrypted_content)
  decrypted_content = @legacy_cryptor.decrypt(base64_encoded)
  expect(decrypted_content).not_to eq nil
  expect(decrypted_content).to eq @source_file_content
end

Then(/^I receive '([^']*)'$/) do |outcome|
  expect(@decrypt_status).not_to eq nil
  expect(@decrypt_status).to eq outcome
end

# Crypto module
#
# @return [Pubnub::Crypto::CryptoModule] Crypto module instance.
def crypto_module
  cryptors = []
  @cryptor_ids.each do |cryptor_id|
    cryptor = if cryptor_id == 'acrh'
                Pubnub::Crypto::AesCbcCryptor.new @cipher_key
              elsif cryptor_id == 'legacy'
                Pubnub::Crypto::LegacyCryptor.new @cipher_key, @use_random_iv
              end
    cryptors.push(cryptor) unless cryptor.nil?
  end

  raise ArgumentError, "No crypto identifiers specified: #{@cryptor_ids}" if cryptors.empty?

  default_cryptor = cryptors.shift
  Pubnub::Crypto::CryptoModule.new default_cryptor, cryptors unless default_cryptor.nil?
end
