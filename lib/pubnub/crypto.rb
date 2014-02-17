# TODO that file isn't refactored yet!
module Pubnub
  class Crypto
    def initialize(cipher_key)
      $logger.debug('Initializing Crypto')
      @alg = 'AES-256-CBC'
      sha256_key = Digest::SHA256.hexdigest(cipher_key)
      @key = sha256_key.slice(0,32)

      @iv = '0123456789012345'
      $logger.debug('Initialized Crypto')
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
      $logger.debug("Decrypting: #{cipher_text}")
      decode_cipher = OpenSSL::Cipher::Cipher.new(@alg)
      decode_cipher.decrypt
      decode_cipher.key = @key
      decode_cipher.iv = @iv

      plain_text = ''

      begin
        undecoded_text = Base64.decode64(cipher_text)
        plain_text = decode_cipher.update(undecoded_text)
        plain_text << decode_cipher.final
      rescue => e
        $logger.error 'DECRYPTION ERROR'
        plain_text =  '"DECRYPTION ERROR"'
      end

      begin
        JSON.load(plain_text)
      rescue JSON::ParserError
        JSON.load("[#{plain_text}]")[0] # srsly ruby? srsly?
      end

      $logger.debug('Finished decrypting')

      plain_text

    end
  end
end
