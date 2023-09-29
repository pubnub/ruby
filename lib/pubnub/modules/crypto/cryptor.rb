# frozen_string_literal: true

module Pubnub
  module Crypto
    # Encrypted data representation object.
    #
    # Objects contain both encrypted data and additional data created by cryptor
    # that will be required to decrypt the data.
    class EncryptedData
      # Cryptor may provide here any information which will be useful when data
      # should be decrypted.
      #
      # For example <i>metadata</i> may contain:
      # * initialization vector
      # * cipher key identifier
      # * encrypted <i>data</i> length
      #
      # @return [String, nil] Cryptor-defined information.
      attr_reader :metadata

      # Encrypted data.
      #
      # @return [String] Encrypted data.
      attr_reader :data

      # Create encrypted data object.
      #
      # An object used to keep track of the results of data encryption and the
      # additional data the <i>cryptor</i> needs to handle it later.
      #
      # @param data [String] Outcome of successful cryptor <i>encrypt</i> method
      #   call.
      # @param  metadata [String, nil] Additional information is provided by
      #   <i>cryptor</i> so that encrypted data can be handled later.
      def initialize(data, metadata = nil)
        @data = data
        @metadata = metadata
      end
    end

    # Base class which is used to implement cryptor that should be used with
    # <i>CryptorProvider</i> implementation for data encryption and decryption.
    class Cryptor
      # Identifier will be encoded into cryptor data header and passed along
      # with encrypted <i>data</i> and <i>metadata</i>.
      #
      # The identifier <b>must</b> be 4 bytes long.
      #
      # @return [String] Unique cryptor identifier.
      def identifier
        raise NotImplementedError, 'Subclass should provide "identifier" method implementation.'
      end

      # Encrypt provided data.
      #
      # @param data [String] Source data for encryption.
      # @return [EncryptedData, nil] Encrypted data or <i>nil</i> in case of
      #   encryption error.
      def encrypt(data)
        raise NotImplementedError, 'Subclass should provide "encrypt" method implementation.'
      end

      # Decrypt provided data.
      #
      # @param data [EncryptedData] Encrypted data for decryption.
      # @return [String, nil] Decrypted data or <i>nil</i> in case of decryption
      #   error.
      def decrypt(data)
        raise NotImplementedError, 'Subclass should provide "decrypt" method implementation.'
      end
    end
  end
end
