module Pubnub::Crypto
  class AesCbcCryptor
    include Cryptor
    BLOCK_SIZE = 16

    def initialize(cipher_key)
      @identifier = 'ACRH'
      @alg = 'AES-256-CBC'
      @cipher_key = cipher_key
    end

    def encrypt(data)
      cipher = OpenSSL::Cipher.new(@alg).encrypt
      cipher.key = @cipher_key
      cipher.iv = OpenSSL::Random.random_bytes BLOCK_SIZE
      encoded_message = cipher.update data
      encoded_message << cipher.final
    end

    def decrypt(data, iv)
      cipher = OpenSSL::Cipher.new(@alg).decrypt
      cipher.key = @cipher_key
      cipher.iv = iv

      decrypted = cipher.update data
      decrypted << cipher.final
    end
  end
end
