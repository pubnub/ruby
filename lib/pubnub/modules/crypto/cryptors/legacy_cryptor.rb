module Pubnub
  module Crypto
    # Legacy cryptor.
    #
    # The cryptor provides _encryption_ and _decryption_ using <i>`AES-256</i> in
    # <i>CBC</i> mode with a cipher key and configurable initialization vector
    # randomness.
    # When it is registered as a secondary with other cryptors, it will provide
    # backward compatibility with previously encrypted data.
    #
    # <b>Important</b>: It has been reported that the digest from cipherKey has
    # low entropy, and it is suggested to use <i>AesCbcCryptor</i> instead.
    class LegacyCryptor < Cryptor
      # AES-128 CBC block size.
      BLOCK_SIZE = 16

      # Create legacy cryptor instance.
      #
      # @param cipher_key [String] Key for data <i>encryption</i> and
      #   <i>decryption</i>.
      # @param use_random_iv [Boolean] Whether random IV should be used.
      def initialize(cipher_key, use_random_iv = true)
        @alg = 'AES-256-CBC'
        @original_cipher_key = cipher_key
        @cipher_key = Digest::SHA256.hexdigest(cipher_key.to_s).slice(0, 32)
        @iv = use_random_iv ? nil : '0123456789012345'
        super()
      end

      def identifier
        '\x00\x00\x00\x00'
      end

      def encrypt(data)
        if data.nil? || data.empty?
          puts 'Pubnub :: ENCRYPTION ERROR: Empty data for encryption'
          return nil
        end

        iv = @iv || OpenSSL::Random.random_bytes(BLOCK_SIZE)
        cipher = OpenSSL::Cipher.new(@alg).encrypt
        cipher.key = @cipher_key
        cipher.iv = iv

        encoded_message = ''
        encoded_message << iv if @iv.nil? && iv
        encoded_message << cipher.update(data)
        encoded_message << cipher.final
        Crypto::EncryptedData.new(encoded_message)
      rescue StandardError => e
        puts "Pubnub :: ENCRYPTION ERROR: #{e}"
        nil
      end

      def decrypt(data)
        encrypted_data = data.data
        iv = if @iv.nil? && encrypted_data.length >= BLOCK_SIZE
               encrypted_data.slice!(0..(BLOCK_SIZE - 1)) if encrypted_data.length >= BLOCK_SIZE
             else
               @iv
             end
        if iv.length != BLOCK_SIZE
          puts "Pubnub :: DECRYPTION ERROR: Unexpected initialization vector length: #{data.metadata.length} bytes (#{BLOCK_SIZE} bytes is expected)"
          return nil
        end

        unless encrypted_data.length.positive?
          puts 'Pubnub :: DECRYPTION ERROR: Empty data for decryption'
          return nil
        end

        cipher = OpenSSL::Cipher.new(@alg).decrypt
        cipher.key = @cipher_key
        cipher.iv = iv

        decrypted = cipher.update encrypted_data
        decrypted << cipher.final
      rescue StandardError => e
        puts "Pubnub :: DECRYPTION ERROR: #{e}"
        nil
      end
    end
  end
end
