# frozen_string_literal: true

module Pubnub
  module Crypto
    # Base class which is used to implement a module that can be used to
    # configure <b>PubNub</b> client or for manual data encryption and
    # decryption.
    class CryptoProvider
      # Encrypt provided data.
      #
      # @param data [String] Source data for encryption.
      # @return [String, nil] Encrypted data or <i>nil</i> in case of encryption
      #   error.
      def encrypt(data)
        raise NotImplementedError, 'Subclass should provide "encrypt" method implementation.'
      end

      # Decrypt provided data.
      #
      # @param data [String] Encrypted data for decryption.
      # @return [String, nil] Decrypted data or <i>nil</i> in case of decryption
      #   error.
      #
      # @raise [UnknownCryptorError] If the <i>cryptor</i> for data processing is
      #   not registered.
      def decrypt(data)
        raise NotImplementedError, 'Subclass should provide "decrypt" method implementation.'
      end
    end
  end
end
