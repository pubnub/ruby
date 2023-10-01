# Internal Crypto class used for message encryption and decryption
class Cryptor
  def initialize(cipher_key, use_random_iv)
    @alg = 'AES-256-CBC'
    sha256_key = Digest::SHA256.hexdigest(cipher_key.to_s)
    @key = sha256_key.slice(0, 32)
    @using_random_iv = use_random_iv
    @iv = @using_random_iv == true ? random_iv : '0123456789012345'
  end

  def encrypt(message)
    aes = OpenSSL::Cipher.new(@alg)
    aes.encrypt
    aes.key = @key
    aes.iv = @iv

    json_message = message.to_json
    cipher = @using_random_iv == true ? @iv : ''
    cipher << aes.update(json_message)
    cipher << aes.final

    Base64.strict_encode64(cipher)
  end

  def decrypt(cipher_text)
    undecoded_text = Base64.decode64(cipher_text)
    iv = @iv

    if cipher_text.length > 16 && @using_random_iv == true
      iv = undecoded_text.slice!(0..15)
    end

    decode_cipher = OpenSSL::Cipher.new(@alg).decrypt
    decode_cipher.key = @key
    decode_cipher.iv = iv

    plain_text = decryption(undecoded_text, decode_cipher)

    plain_text
  end

  private

  def decryption(cipher_text, decode_cipher)
    plain_text = decode_cipher.update(cipher_text)
    plain_text << decode_cipher.final
  rescue StandardError => e
    puts "Pubnub :: DECRYPTION ERROR: #{e}"
    '"DECRYPTION ERROR"'
  end

  private

  def random_iv
    random_bytes = Random.new.bytes(16).unpack('NnnnnN')
    format('%08x%04x%04x', *random_bytes)
  end
end