module Pubnub
  module Crypto
    # Cryptor data header.
    #
    # This instance used to parse header from received data and encode into
    # binary for sending.
    class CryptorHeader
      module Versions
        # Currently used cryptor data header schema version.
        CURRENT_VERSION = 1

        # Base class for cryptor data schema.
        class CryptorHeaderData
          # Cryptor header version.
          #
          # @return [Integer] Cryptor header version.
          def version
            raise NotImplementedError, 'Subclass should provide "version" method implementation.'
          end

          # Cryptor identifier.
          #
          # @return [String] Identifier of the cryptor which has been used to
          #   encrypt data.
          def identifier
            raise NotImplementedError, 'Subclass should provide "identifier" method implementation.'
          end

          # Cryptor-defined data size.
          #
          # @return [Integer] Cryptor-defined data size.
          def data_size
            raise NotImplementedError, 'Subclass should provide "data_size" method implementation.'
          end
        end

        # v1 cryptor header schema.
        #
        # This header consists of:
        # * sentinel (4 bytes)
        # * version (1 byte)
        # * cryptor identifier (4 bytes)
        # * cryptor data size (1 byte if less than 255 and 3 bytes in other cases)
        # * cryptor-defined data
        class CryptorHeaderV1Data < CryptorHeaderData
          # Identifier of the cryptor which has been used to encrypt data.
          #
          # @return [String] Identifier of the cryptor which has been used to
          #   encrypt data.
          attr_reader :identifier

          # Cryptor-defined data size.
          #
          # @return [Integer] Cryptor-defined data size.
          attr_reader :data_size

          # Create cryptor header data.
          #
          # @param identifier [String] Identifier of the cryptor which has been
          #   used to encrypt data.
          # @param data_size [Integer] Cryptor-defined data size.
          def initialize(identifier, data_size)
            @identifier = identifier
            @data_size = data_size
          end

          def version
            1
          end
        end
      end

      # Create cryptor header.
      #
      # @param identifier [String] Identifier of the cryptor which has been used
      #   to encrypt data.
      # @param metadata [String, nil] Cryptor-defined information.
      def initialize(identifier = nil, metadata = nil)
        @data = if identifier && identifier != '\x00\x00\x00\x00'
                  Versions::CryptorHeaderV1Data.new(
                    identifier.to_s,
                    metadata&.length || 0
                  )
                end
      end

      # Parse cryptor header data to create instance.
      #
      # @param data [String] Data which <i>may</i> contain cryptor header
      #   information.
      # @return [CryptorHeader, nil] Header instance or <i>nil</i> in case of
      #   encrypted data parse error.
      #
      # @raise [ArgumentError] Raise an exception if <i>data</i> is <i>nil</i>
      #   or empty.
      # @raise [UnknownCryptorError] Raise an exception if, during cryptor
      #   header data parsing, an unknown cryptor header version is encountered.
      def self.parse(data)
        if data.nil? || data.empty?
          raise ArgumentError, {
            message: '\'data\' is required and should not be empty.'
          }
        end

        # Data is too short to be encrypted. Assume legacy cryptor without
        # header.
        return CryptorHeader.new if data.length < 4 || data.unpack('A4').last != 'PNED'

        # Malformed crypto header.
        return nil if data.length < 10

        # Unpack header bytes.
        _, version, identifier, data_size = data.unpack('A4 C A4 C')

        # Check whether version is within known range.
        if version > CryptorHeader.current_version
          raise UnknownCryptorError, {
            message: 'Decrypting data created by unknown cryptor.'
          }
        end

        if data_size == 255
          data_size = data.unpack('A4 C A4 C n').last if data.length >= 12
          return CryptorHeader.new if data.length < 12
        end

        header = CryptorHeader.new
        header.send(
          :update_header_data,
          CryptorHeader.create_header_data(version.to_i, identifier.to_s, data_size.to_i)
        )
        header
      end

      # Overall header size.
      #
      # Full header size which includes:
      # * sentinel
      # * version
      # * cryptor identifier
      # * cryptor data size
      # * cryptor-defined fields size.
      def length
        # Legacy payload doesn't have header.
        return 0 if @data.nil?

        9 + (data_size < 255 ? 1 : 3)
      end

      # Crypto header version Version module.
      #
      # @return [Integer] One of known versions from Version module.
      def version
        header_data&.version || 0
      end

      # Identifier of the cryptor which has been used to encrypt data.
      #
      # @return [String, nil] Identifier of the cryptor which has been used to
      #   encrypt data.
      def identifier
        header_data&.identifier || nil
      end

      # Cryptor-defined information size.
      #
      # @return [Integer] Cryptor-defined information size.
      def data_size
        header_data&.data_size || 0
      end

      # Create cryptor header data object.
      #
      # @param version [Integer] Cryptor header data schema version.
      # @param identifier [String] Encrypting cryptor identifier.
      # @param size [Integer] Cryptor-defined data size
      # @return [Versions::CryptorHeaderData] Cryptor header data.
      def self.create_header_data(version, identifier, size)
        Versions::CryptorHeaderV1Data.new(identifier, size) if version == 1
      end

      # Crypto header which is currently used to encrypt data.
      #
      # @return [Integer] Current cryptor header version.
      def self.current_version
        Versions::CURRENT_VERSION
      end

      # Serialize cryptor header.
      #
      # @return [String] Cryptor header data, which is serialized as a binary
      #   string.
      #
      # @raise [ArgumentError] Raise an exception if a <i>cryptor</i> identifier
      #   is not provided for a non-legacy <i>cryptor</i>.
      def to_s
        # We don't need to serialize header for legacy cryptor.
        return '' if version.zero?

        cryptor_identifier = identifier
        if cryptor_identifier.nil? || cryptor_identifier.empty?
          raise ArgumentError, {
            message: '\'identifier\' is missing or empty.'
          }
        end

        header_bytes = ['PNED', version, cryptor_identifier]
        if data_size < 255
          header_bytes.push(data_size)
        else
          header_bytes.push(255, data_size)
        end

        header_bytes.pack(data_size < 255 ? 'A4 C A4 C' : 'A4 C A4 C n')
      end

      private

      # Versioned cryptor header data
      #
      # @return [Versions::CryptorHeaderData, nil] Cryptor header data.
      def header_data
        @data
      end

      # Update crypto header version.
      #
      # @param data [Versions::CryptorHeaderData] Header version number parsed from binary data.
      def update_header_data(data)
        @data = data
      end

      # Update crypto header version.
      #
      # @param value [Integer] Header version number parsed from binary data.
      def update_version(value)
        @version = value
      end

      # Update cryptor-defined data size.
      #
      # @param value [Integer] Cryptor-defined data size parsed from binary
      #   data.
      def update_data_size(value)
        @data_size = value
      end

      private_class_method :create_header_data, :current_version
    end
  end
end
