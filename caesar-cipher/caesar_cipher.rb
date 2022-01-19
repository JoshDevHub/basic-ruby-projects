# frozen_string_literal: true

# class for creating cipher text with caesar method
class CaesarCipher
  def encode(plaintext, shift_factor)
    adjusted_shift = adjust_shift(shift_factor)
    return plaintext if adjusted_shift.zero?

    shifted_array = plaintext.codepoints.map do |ascii_char|
      if alphabetical?(ascii_char)
        shift_char(ascii_char, adjusted_shift)
      else
        ascii_char
      end
    end
    shifted_array.map(&:chr).join
  end

  def adjust_shift(number)
    alphabet_count = 26
    if number.negative? || number >= alphabet_count
      number % alphabet_count
    else
      number
    end
  end

  def lowercase?(char)
    char.between?(97, 122)
  end

  def uppercase?(char)
    char.between?(65, 90)
  end

  def alphabetical?(char)
    lowercase?(char) || uppercase?(char)
  end

  def shift_char(char, shift)
    new_char = char + shift
    if lowercase?(char) && new_char > 122
      offset = new_char - 122
      new_char = 96 + offset
    elsif uppercase?(char) && new_char > 90
      offset = new_char - 90
      new_char = 64 + offset
    end
    new_char
  end
end
