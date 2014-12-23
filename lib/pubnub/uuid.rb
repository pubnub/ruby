# Toplevel Pubnub module
module Pubnub
  # Module used to generate new UUID number according to
  module UUID
    class << self
      def generate
        arr = Random.new.bytes(16).unpack('NnnnnN')
        arr[2] = (arr[2] & 0x0fff) | 0x4000
        arr[3] = (arr[3] & 0x3fff) | 0x8000
        sprintf('%08x-%04x-%04x-%04x-%04x%08x', *arr)
      end
    end
  end
end
