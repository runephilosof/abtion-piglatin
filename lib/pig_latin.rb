# frozen_string_literal: true

require 'active_support/core_ext'

# Speak Pig Latin.
class PigLatin
  CONSONANT = /[^auoieAUOIE]/.freeze
  UPCASE = /[A-Z]/.freeze

  def convert(words)
    words
      .split(/(\w+)/)
      .map { |word| convert_word(word) }
      .join
  end

  def convert_word(word)
    return word unless word =~ /\w/

    letters_to_move = letters_to_move(word)
    tail = word.from(letters_to_move)
    first = word.first(letters_to_move).downcase

    tail = tail.upcase_first if word.first =~ UPCASE

    "#{tail}#{first}ay"
  end

  def letters_to_move(word)
    if word.first(2) == 'ch'
      2
    elsif word.first =~ CONSONANT
      1
    else
      0
    end
  end
end
