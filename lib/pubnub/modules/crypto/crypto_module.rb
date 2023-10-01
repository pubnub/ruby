module Pubnub
  module Crypto
    # Crypto module for data processing.
    #
    # The PubNub client uses a module to encrypt and decrypt sent data in a way
    # that's compatible with previous versions (if additional cryptors have been
    # registered).
    class CryptoModule < CryptoProvider
      # AES-CBC cryptor based module.
      #
      # Data <i>encryption</i> and <i>decryption</i> will be done by default
      # using the <i>AesCbcCryptor</i>. In addition to the <i>AesCbcCryptor</i>
      # for data <i>decryption</i>, the <i>LegacyCryptor</i> will be registered
      # for backward-compatibility.
      #
      # @param cipher_key [String] Key for data encryption and decryption.
      # @param use_random_iv [Boolean] Whether random IV should be used for data
      #   decryption.
      #
      # @raise [ArgumentError] If the <i>cipher_key</i> is missing or empty.
      def self.new_aes_cbc(cipher_key, use_random_iv)
        if cipher_key.nil? || cipher_key.empty?
          raise ArgumentError, {
            message: '\'cipher_key\' is missing or empty.'
          }
        end

        CryptoModule.new AesCbcCryptor.new(cipher_key), [LegacyCryptor.new(cipher_key, use_random_iv)]
      end

      # Legacy AES-CBC cryptor based module.
      #
      # Data <i>encryption</i> and <i>decryption</i> will be done by default
      # using the <i>LegacyCrypto</i>. In addition to the <i>LegacyCrypto</i>
      # for data <i>decryption</i>, the <i>AesCbcCryptor</i> will be registered
      # for future-compatibility (which will help with gradual application
      # updates).
      #
      # @param cipher_key [String] Key for data encryption and decryption.
      # @param use_random_iv [Boolean] Whether random IV should be used for data
      #   decryption.
      #
      # @raise [ArgumentError] If the <i>cipher_key</i> is missing or empty.
      def self.new_legacy(cipher_key, use_random_iv)
        if cipher_key.nil? || cipher_key.empty?
          raise ArgumentError, {
            message: '\'cipher_key\' is missing or empty.'
          }
        end

        CryptoModule.new LegacyCryptor.new(cipher_key, use_random_iv), [AesCbcCryptor.new(cipher_key)]
      end

      # Create crypto module.
      #
      # @param default [Cryptor] Default cryptor used to encrypt and decrypt
      #   data.
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
        super()
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
        return nil if header.nil?

        cryptor_identifier = header.identifier || '\x00\x00\x00\x00'
        cryptor = cryptor cryptor_identifier

        # Check whether there is a cryptor to decrypt data or not.
        if cryptor.nil?
          identifier = header.identifier || 'UNKN'
          raise UnknownCryptorError, {
            message: "Decrypting data created by unknown cryptor. Please make sure to register
#{identifier} or update SDK."
          }
        end

        encrypted_data = data[header.length..-1]
        metadata = metadata encrypted_data, header.data_size

        # Check whether there is still some data for processing or not.
        return nil if encrypted_data.nil? || encrypted_data.empty?

        cryptor.decrypt(EncryptedData.new(encrypted_data, metadata))
      end

      private

      # Cryptor used by the module by default to encrypt data.
      #
      # @return [Cryptor] Default cryptor used to encrypt and decrypt data.
      def default_cryptor
        @default
      end

      # Additional cryptors that can be used to decrypt data if the
      # <i>default_cryptor</i> can't.
      #
      # @return [Hash<String, Cryptor>] Map of Cryptor to their identifiers.
      def additional_cryptors
        @cryptors
      end

      # Extract metadata information from source data.
      #
      # @param data [String, nil] Encrypted data from which cryptor metadata
      #   should be extracted.
      # @param size [Integer] Size of cryptor-defined data.
      # @return [String, nil] Extracted metadata or <i>nil</i> in case if
      #   <i>size</i> is <b>0</b>.
      def metadata(data, size)
        return nil if !data || !size.positive?

        data&.slice!(0..(size - 1))
      end

      # Find cryptor with a specified identifier.
      #
      # Data decryption can only be done with registered cryptors. An identifier
      # in the cryptor data header is used to identify a suitable cryptor.
      #
      # @param identifier [String] A unicode cryptor identifier.
      # @return [Cryptor, nil] Target cryptor or `nil` in case there is none
      #   with the specified identifier.
      def cryptor(identifier)
        return default_cryptor if default_cryptor.identifier == identifier

        additional_cryptors.fetch(identifier, nil)
      end
    end
  end
end