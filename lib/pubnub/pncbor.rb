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

  ADDITIONAL_LENGTH_1B = 24
  ADDITIONAL_LENGTH_2B = 25
  ADDITIONAL_LENGTH_4B = 26
  ADDITIONAL_LENGTH_8B = 27

  ADDITIONAL_TYPE_INDEFINITE = 31

  INDEFINITE_BREAK = 0b11111111

  ADDITIONAL_LENGTH_BYTES = {
    ADDITIONAL_LENGTH_1B => 1,
    ADDITIONAL_LENGTH_2B => 2,
    ADDITIONAL_LENGTH_4B => 4,
    ADDITIONAL_LENGTH_8B => 8,
  }

  SIMPLE_VALUE_FALSE = 'F4'
  SIMPLE_VALUE_TRUE = 'F5'
  SIMPLE_VALUE_NULL = 'F6'
  SIMPLE_VALUE_UNDEF = 'F7'
  SIMPLE_VALUE_UNDEF = 'F7'

  REPLACEMENTS = {
    ' ' => ''
  }

  def sanitize_input(value)
    value.gsub(Regexp.union(REPLACEMENTS.keys), REPLACEMENTS).upcase unless false #check if hexadecimal
  end

  def shift(data, length)
    value = data[...length]
    data[...length] = ""
    value
  end

  def decode_integer(data, additional)
    if ADDITIONAL_LENGTH_BYTES.member?(additional)
      shift(data, ADDITIONAL_LENGTH_BYTES[additional] * 2).to_i(16)
    else
      additional
    end
  end

  def decode_float(value, precision)
    bytes = value.to_i(16)
    case (precision)
    when ADDITIONAL_LENGTH_2B
      sign = (bytes & 0b1000000000000000) >> 15 != 0 ? -1 : 1
      exp = (bytes & 0b0111110000000000) >> 10
      mant = bytes & 0b1111111111
      if exp == 0
        result = (2 ** -14) * (mant / 1024)
      elsif exp == 0b11111
        result = Float::INFINITY
      else
        result = (2 ** (exp - 15)) * (1 + mant / 1024.to_f)
      end
      return sign * result
    when ADDITIONAL_LENGTH_4B
      sign = (bytes >> 31) != 0 ? -1 : 1
      x = (bytes & ((1 << 23) - 1)) + (1 << 23) * (bytes >> 31 | 1)
      exp = (bytes >> 23 & 0xFF) - 127
      return x * (2 ** (exp - 23)) * sign
    when ADDITIONAL_LENGTH_8B
      sign = (bytes >> 63) != 0 ? -1 : 1
      exp = (bytes >> 52) & 0x7ff

      mant = bytes & 0xfffffffffffff

      if 0 == exp
        val = mant * 2 ** (-(1022 + 52))
      elsif 0b11111111111 != exp
        val = (mant + (1 << 52)) * 2 ** (exp - (1023 + 52))
      else
        val = 0 == mant ? Float::INFINITY : Float::NAN
      end
      return sign * val
    end
  end

  def decode_string(data, additional)
    if ADDITIONAL_LENGTH_BYTES.member?(additional)
      length = shift(data, ADDITIONAL_LENGTH_BYTES[additional] * 2).to_i(16)
      [shift(data, length * 2)].pack('H*')
    elsif additional == ADDITIONAL_TYPE_INDEFINITE

    else
      [shift(data, additional * 2)].pack('H*')
    end
  end

  def parse_data(data)
    byte = shift(data, 2)

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
      bits = byte.to_i(16)
      type = bits & TYPE_MASK
      additional = bits & ADDITIONAL_MASK

      case (type)
      when TYPE_NEGATIVE_INT
        -1 - decode_integer(data, additional)
      when TYPE_UNSIGNED_INT
        decode_integer(data, additional)
      when TYPE_FLOAT
        if additional <= 23
          additional
        elsif additional == ADDITIONAL_LENGTH_1B
          shift(data, 2)
        else
          decode_float(shift(data, ADDITIONAL_LENGTH_BYTES[additional] * 2), additional).to_f
        end
      when TYPE_BYTE_STRING
        decode_string(data, additional).force_encoding('UTF-8')
      when TYPE_TEXT_STRING
        decode_string(data, additional).force_encoding('UTF-8')
      when TYPE_ARRAY
        if ADDITIONAL_LENGTH_BYTES.member?(additional)
          length = shift(data, ADDITIONAL_LENGTH_BYTES[additional] * 2).to_i(16)
        else
          length = additional
        end
        (1..length).map { parse_data(data) }
      when TYPE_HASHMAP
        if ADDITIONAL_LENGTH_BYTES.member?(additional)
          length = shift(data, ADDITIONAL_LENGTH_BYTES[additional] * 2).to_i(16)
        else
          length = additional
        end
        (1..length).to_h { [parse_data(data), parse_data(data)] }
      else
        nil
      end
    end
  end

  def decode(value)
    sanitized = sanitize_input(value)
    parse_data(sanitized)
  end
end
