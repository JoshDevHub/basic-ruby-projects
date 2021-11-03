def caesar_cipher(plaintext, shift_factor)
  shifted_array = plaintext.codepoints.map do |number|
    if number > 96 && number < 123
      number += shift_factor
      if number > 122
        offset = number - 122
        number = 96 + offset
      else
        number
      end
    elsif number > 64 && number < 91
      number += shift_factor
      if number > 90
        offset = number - 90
        number = 64 + offset
      else
        number
      end
    else
      number
    end
  end
  shifted_array.map { |number| number.chr }.join
end 

puts caesar_cipher('jvtwbaly', 19)