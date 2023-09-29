module Pubnub::Crypto
  class LegacyCryptor
    include Cryptor
    BLOCK_SIZE = 16

    def initialize(cipher_key, use_random_iv)
      @identifier = ''
      @alg = 'AES-256-CBC'
      @cipher_key = cipher_key
      @iv = use_random_iv ? nil : '0123456789012345'
    end

    def encrypt(data)
      cipher = OpenSSL::Cipher.new(@alg).encrypt
      cipher.key = @cipher_key
      cipher.iv = !@iv.nil? ? @iv : OpenSSL::Random.random_bytes(BLOCK_SIZE)
      encoded_message = cipher.update data
      encoded_message << cipher.final

      Base64.strict_encode64(encoded_message)
    end

    def decrypt(data, iv)
      iv = @iv

      undecoded_text = Base64.strict_decode64(data)
      if data.length > 16 && !@iv.nil?
        iv = undecoded_text.slice!(0..15)
      end

      cipher = OpenSSL::Cipher.new(@alg).decrypt
      cipher.key = @cipher_key
      cipher.iv = iv

      decrypted = cipher.update undecoded_text
      decrypted << cipher.final
    end
  end
end
