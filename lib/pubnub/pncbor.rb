module Pncbor
  TYPE_MASK = 0b11100000
  ADDITIONAL_MASK = 0b00011111

  TYPE_UNSIGNED_INT = 0b00000000
  TYPE_NEGATIVE_INT = 0b00100000
  TYPE_BYTE_STRING = 0b01000000
  TYPE_TEXT_STRING = 0b01100000
  TYPE_ARRAY = 0b10000000
  TYPE_HASHMAP = 0b10100000
  TYPE_TAG = 0b11000000
  TYPE_FLOAT = 0b11100000

  ADDITIONAL_TYPE_INDEFINITE = 31
  INDEFINITE_BREAK = 0b11111111

  ADDITIONAL_LENGTH_1B = 24
  ADDITIONAL_LENGTH_2B = 25
  ADDITIONAL_LENGTH_4B = 26
  ADDITIONAL_LENGTH_8B = 27

  ADDITIONAL_LENGTH_BYTES = {
    ADDITIONAL_LENGTH_1B => 1,
    ADDITIONAL_LENGTH_2B => 2,
    ADDITIONAL_LENGTH_4B => 4,
    ADDITIONAL_LENGTH_8B => 8,
  }

  SIMPLE_VALUE_FALSE = 0xF4
  SIMPLE_VALUE_TRUE = 0xF5
  SIMPLE_VALUE_NULL = 0xF6
  SIMPLE_VALUE_UNDEF = 0xF7

  def bytearray_to_i(byte_array)
    byte_array.reverse_each.map.with_index do |b, i|
      b << 8 * i
    end.reduce(0) do |reduced, byte|
      reduced | byte
    end
  end

  def decode_integer(data, additional)
    if ADDITIONAL_LENGTH_BYTES.member?(additional)
      bytearray_to_i(data.shift(ADDITIONAL_LENGTH_BYTES[additional]))
    else
      additional
    end
  end

  def decode_float(data, additional)
    if additional <= 23
      additional
    else
      bytes = bytearray_to_i(data.shift(ADDITIONAL_LENGTH_BYTES[additional]))
      case (additional)
      when ADDITIONAL_LENGTH_1B
        bytes
      when ADDITIONAL_LENGTH_2B
        sign = (bytes >> 15) != 0 ? -1 : 1
        exp = (bytes & 0b0111110000000000) >> 10
        mant = bytes & 0b1111111111
        if exp == 0
          result = (2 ** -14) * (mant / 1024.to_f)
        elsif exp == 0b11111
          result = Float::INFINITY
        else
          result = (2 ** (exp - 15)) * (1 + mant / 1024.to_f)
        end
        sign * result
      when ADDITIONAL_LENGTH_4B
        sign = (bytes >> 31) != 0 ? -1 : 1
        x = (bytes & ((1 << 23) - 1)) + (1 << 23)
        exp = (bytes >> 23 & 0xFF) - 127
        x * (2 ** (exp - 23)) * sign
      when ADDITIONAL_LENGTH_8B
        sign = (bytes >> 63) != 0 ? -1 : 1
        exp = (bytes >> 52) & 0x7FF

        mant = bytes & 0xFFFFFFFFFFFFF

        if 0 == exp
          val = mant * 2 ** (-(1022 + 52))
        elsif 0b11111111111 != exp
          val = (mant + (1 << 52)) * 2 ** (exp - (1023 + 52))
        else
          val = 0 == mant ? Float::INFINITY : Float::NAN
        end
        sign * val
      end
    end
  end

  def indefinite_data(data)
    result = []

    loop do
      byte = data.shift
      break if byte == INDEFINITE_BREAK
      result.append(byte)
      break if data.empty?
    end
    result
  end

  def compute_length(data, additional)
    if ADDITIONAL_LENGTH_BYTES.member?(additional)
      bytearray_to_i(data.shift(ADDITIONAL_LENGTH_BYTES[additional]))
    else
      additional
    end
  end

  def decode_string(data, additional)
    if additional == ADDITIONAL_TYPE_INDEFINITE
      indefinite_data(data).pack('C*').force_encoding('UTF-8')
    else
      length = compute_length(data, additional)
      data.shift(length).pack('C*').force_encoding('UTF-8')
    end
  end

  def decode_map(data, additional)
    length = compute_length(data, additional)
    (1..length).to_h { [parse_data(data), parse_data(data)] }
  end

  def decode_array(data, additional)
    length = compute_length(data, additional)
    (1..length).map { parse_data(data) }
  end

  def parse_data(data)
    byte = data.shift

    case (byte)
    when SIMPLE_VALUE_NULL
      return nil
    when SIMPLE_VALUE_TRUE
      return true
    when SIMPLE_VALUE_FALSE
      return false
    when SIMPLE_VALUE_UNDEF
      return nil
    else
      type = byte & TYPE_MASK
      additional = byte & ADDITIONAL_MASK

      case (type)
      when TYPE_NEGATIVE_INT
        -1 - decode_integer(data, additional)
      when TYPE_UNSIGNED_INT
        decode_integer(data, additional)
      when TYPE_FLOAT
        decode_float(data, additional).to_f
      when TYPE_BYTE_STRING
        decode_string(data, additional)
      when TYPE_TEXT_STRING
        decode_string(data, additional)
      when TYPE_ARRAY
        decode_array(data, additional)
      when TYPE_HASHMAP
        decode_map(data, additional)
      else
        nil
      end
    end
  end

  def decode(value)
    parse_data(value)
  end
end
