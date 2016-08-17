# Toplevel Pubnub module.
module Pubnub
  # Internal Crypto class used for message encryption and decryption
  class Crypto
    def initialize(cipher_key)
      @alg = 'AES-256-CBC'
      sha256_key = Digest::SHA256.hexdigest(cipher_key)
      @key = sha256_key.slice(0, 32)

      @iv = '0123456789012345'
    end

    def encrypt(message)
      aes = OpenSSL::Cipher::Cipher.new(@alg)
      aes.encrypt
      aes.key = @key
      aes.iv = @iv

      json_message = message.to_json
      cipher = aes.update(json_message)
      cipher << aes.final

      Base64.strict_encode64(cipher)
    end

    def decrypt(cipher_text)
      decode_cipher = OpenSSL::Cipher::Cipher.new(@alg).decrypt
      decode_cipher.key = @key
      decode_cipher.iv  = @iv

      plain_text = decryption(cipher_text, decode_cipher)
      load_json(plain_text)

      Pubnub.logger.debug('Pubnub') { 'Finished decrypting' }

      plain_text
    end

    private

    def decryption(cipher_text, decode_cipher)
      undecoded_text = Base64.decode64(cipher_text)
      plain_text = decode_cipher.update(undecoded_text)
      plain_text << decode_cipher.final
    rescue => e
      Pubnub.logger.error('Pubnub') { "DECRYPTION ERROR #{e}" }
      '"DECRYPTION ERROR"'
    end

    def load_json(text)
      JSON.load(text)
    rescue JSON::ParserError
      JSON.load("[#{text}]")[0]
    end
  end
end
