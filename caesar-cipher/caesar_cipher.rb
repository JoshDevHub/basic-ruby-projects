# frozen_string_literal: true

# class for creating cipher text with caesar method
class CaesarCipher
  def encode(plaintext, shift_factor)
    adjusted_shift = adjust_shift(shift_factor)
    return plaintext if adjusted_shift.zero?

    shifted_array = plaintext.codepoints.map do |ascii_char|
      if ascii_char > 96 && ascii_char < 123
        ascii_char += adjusted_shift
        if ascii_char > 122
          offset = ascii_char - 122
          96 + offset
        else
          ascii_char
        end
      elsif ascii_char > 64 && ascii_char < 91
        ascii_char += adjusted_shift
        if ascii_char > 90
          offset = ascii_char - 90
          64 + offset
        else
          ascii_char
        end
      else
        ascii_char
      end
    end
    shifted_array.map { |number| number.chr }.join
  end

  def adjust_shift(number)
    alphabet_count = 26
    if number.negative? || number >= alphabet_count
      number % alphabet_count
    else
      number
    end
  end
end

p CaesarCipher.new.encode('A', -1)