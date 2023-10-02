# frozen_string_literal: true

module Pubnub
  module Crypto
    # AES-256-CBC cryptor.
    #
    # The cryptor provides _encryption_ and _decryption_ using <i>AES-256</i> in
    # <i>CBC</i> mode with a cipher key and random initialization vector.
    # When it is registered as a secondary with other cryptors, it will provide
    # backward compatibility with previously encrypted data.
    class AesCbcCryptor < Cryptor
      # AES-128 CBC block size.
      BLOCK_SIZE = 16

      # Create AES-256-CBC cryptor instance.
      #
      # @param cipher_key [String] Key for data <i>encryption</i> and
      #   <i>decryption</i>.
      def initialize(cipher_key)
        @cipher_key = Digest::SHA256.digest(cipher_key)
        @alg = 'AES-256-CBC'
        super()
      end

      def identifier
        'ACRH'
      end

      def encrypt(data)
        if data.nil? || data.empty?
          puts 'Pubnub :: ENCRYPTION ERROR: Empty data for encryption'
          nil
        end

        iv = OpenSSL::Random.random_bytes BLOCK_SIZE
        cipher = OpenSSL::Cipher.new(@alg).encrypt
        cipher.key = @cipher_key
        cipher.iv = iv

        encoded_message = cipher.update data
        encoded_message << cipher.final
        Crypto::EncryptedData.new(encoded_message, iv)
      rescue StandardError => e
        puts "Pubnub :: ENCRYPTION ERROR: #{e}"
        nil
      end

      def decrypt(data)
        if data.metadata.length != BLOCK_SIZE
          puts "Pubnub :: DECRYPTION ERROR: Unexpected initialization vector length:
#{data.metadata.length} bytes (#{BLOCK_SIZE} bytes is expected)"
          return nil
        end

        cipher = OpenSSL::Cipher.new(@alg).decrypt
        cipher.key = @cipher_key
        cipher.iv = data.metadata

        decrypted = cipher.update data.data
        decrypted << cipher.final
      rescue StandardError => e
        puts "Pubnub :: DECRYPTION ERROR: #{e}"
        nil
      end
    end
  end
end
