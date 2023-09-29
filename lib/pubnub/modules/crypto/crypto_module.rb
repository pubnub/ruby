# frozen_string_literal: true

module Pubnub
  # Crypto module for data processing.
  #
  # The PubNub client uses a module to encrypt and decrypt sent data in a way
  # that's compatible with previous versions (if additional cryptors have been
  # registered).
  class CryptoModule < Crypto::CryptoProvider
    # Legacy AES-CBC cryptor based module.
    #
    # Data encryption and decryption will be done by default using the
    # <i>LegacyCrypto</i>. In addition to the <i>LegacyCrypto</i> for data
    # decryption, the <i>AesCbcCryptor</i> will be registered for
    # future-compatibility (which will help with gradual application updates).
    #
    # @param cipher_key [String] Key for data encryption and decryption.
    # @param use_random_iv [Boolean] Whether random IV should be used for data decryption.
    def self.new_aes_cbc(cipher_key, use_random_iv)
      # TODO: Create AES-CBC based crypto module
    end

    # Legacy AES-CBC cryptor based module.
    #
    # Data encryption and decryption will be done by default using the
    # <i>LegacyCrypto</i>. In addition to the <i>LegacyCrypto</i> for data
    # decryption, the <i>AesCbcCryptor</i> will be registered for
    # future-compatibility (which will help with gradual application updates).
    #
    # @param cipher_key [String] Key for data encryption and decryption.
    # @param use_random_iv [Boolean] Whether random IV should be used for data decryption.
    def self.new_legacy(cipher_key, use_random_iv)
      # TODO: Create legacy AES-CBC based crypto module
    end

    # Create crypto module.
    # @param default [Cryptor] Default cryptor used to encrypt and decrypt data.
    # @param cryptors [Array<Cryptor>, nil] Additional cryptors which will be
    #   used to decrypt data encrypted by previously used cryptors.
    def initialize(default, cryptors)
      if default.nil?
        raise ArgumentError, {
          message: '\'default\' cryptor required for data encryption.'
        }
      end

      @default = default
      @cryptors = cryptors&.each_with_object({}) do |value, hash|
        hash[value.identifier] = value
      end || {}
    end

    def encrypt(data)
      # Encrypting provided data.
      encrypted_data = default_cryptor.encrypt(data)
      return nil if encrypted_data.nil?

      payload = Crypto::CryptorHeader.new(default_cryptor.identifier, encrypted_data.metadata).to_s
      payload << encrypted_data.metadata unless encrypted_data.metadata.nil?
      payload << encrypted_data.data
    end

    def decrypt(data)
      header = Crypto::CryptorHeader.parse(data)
      cryptor = cryptor(header&.identifier || '\x00\x00\x00\x00')

      # Check whether there is a cryptor to decrypt data or not.
      if cryptor.nil?
        identifier = header&.identifier || 'UNKN'
        raise UnknownCryptorError, {
          message: "Decrypting data created by unknown cryptor. Please make sure to register
#{identifier} or update SDK."
        }
      end

      metadata_size = header&.data_size || 0
      metadata = metadata_size.positive? ? data[0..metadata_size] : nil
      data = data[metadata_size..-1]

      return nil if data.nil?

      cryptor.decrypt(EncryptedData.new(data, metadata))
    end

    private

    # Cryptor used by the module by default to encrypt data.
    #
    # @return [Cryptor] Default cryptor used to encrypt and decrypt data.
    def default_cryptor
      @default
    end

    # Additional cryptors that can be used to decrypt data if the
    # default_cryptor can't.
    #
    # @return [Hash<String, Cryptor>] Map of Cryptor to their identifiers.
    def additional_cryptors
      @cryptors
    end

    # Find cryptor with a specified identifier.
    #
    # Data decryption can only be done with registered cryptors. An identifier
    # in the cryptor data header is used to identify a suitable cryptor.
    #
    # @param identifier [String] A unicode cryptor identifier.
    # @return [Cryptor, nil] Target cryptor or `nil` in case there is none with
    #   the specified identifier.
    def cryptor(identifier)
      return default_cryptor if default_cryptor.identifier == identifier

      additional_cryptors.fetch(identifier, nil)
    end
  end
end