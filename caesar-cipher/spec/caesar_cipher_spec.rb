# frozen_string_literal: true

# spec/caesar_cipher_spec.rb

require './caesar_cipher'

describe CaesarCipher do
  describe '#encode' do
    subject(:cipher) { described_class.new }

    it 'shifts a string of lowercase letters by 19 spots' do
      string_to_decode = 'jvtwbaly'
      shift_factor = 19
      expect(cipher.encode(string_to_decode, shift_factor)).to eql('computer')
    end

    it 'shitfs a string of uppercase letters by 19 spots' do
      uppercase_string = 'JVTWBALY'
      shift_factor = 19
      expect(cipher.encode(uppercase_string, shift_factor)).to eql('COMPUTER')
    end

    it 'ignores non-alphabetical characters when shifting' do
      string = 'Hello, World!'
      shift_factor = 1
      expect(cipher.encode(string, shift_factor)).to include(',', '!')
    end

    it 'wraps if the shift factor carries the character beyond Z' do
      string = 'Z'
      shift_factor = 1
      expect(cipher.encode(string, shift_factor)).to eql('A')
    end

    it 'shifts a string with a negative -10 factor' do
      string = 'rovvy, gybvn'
      shift_factor = -10
      expect(cipher.encode(string, shift_factor)).to eql('hello, world')
    end

    it 'shifts a string with a large factor of 117' do
      string = 'uryyb, jbeyq'
      shift_factor = 117
      expect(cipher.encode(string, shift_factor)).to eql('hello, world')
    end

    it 'shifts a string with a large negative factor of -82' do
      string = 'lipps, asvph'
      shift_factor = -82
      expect(cipher.encode(string, shift_factor)).to eql('hello, world')
    end
  end
end
