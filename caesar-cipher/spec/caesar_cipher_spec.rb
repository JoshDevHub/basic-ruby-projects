# frozen_string_literal: true

# spec/caesar_cipher_spec.rb

require './caesar-cipher'

describe '#caesar_cipher' do
  it 'takes shifts a string of lowercase letters' do
    expect(caesar_cipher('jvtwbaly', 19)).to eql('computer')
  end

  it 'it shifts a string of uppercase letters' do
    expect(caesar_cipher('JVTWBALY', 19)).to eql('COMPUTER')
  end

  it 'ignores non-alphabetical characters' do
    expect(caesar_cipher('Gdkkn, Vnqkc!', 1)).to eql('Hello, World!')
  end

  it 'the shift wraps if the shift factor leads the character beyond Z/z' do
    expect(caesar_cipher('Z', 1)).to eql('A')
  end
end
