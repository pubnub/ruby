module Pubnub::Crypto::Cryptor
  attr_reader :identifier
  attr_reader :alg
  attr_reader :cipher_key

  def encrypt(data)
    raise 'Not Implemented'
  end

  def decrypt(data, iv)
    raise 'Not Implemented'
  end
end