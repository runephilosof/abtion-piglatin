# frozen_string_literal: true

require 'active_support/core_ext'

class PigLatin
  CONSONANT = /[^auoieAUOIE]/.freeze

  def convert(words)
    words.split(/(\w+)/).map {|word| convert_word(word) }.join
  end

  def convert_word(word)
    return word unless word.match(/\w/)

    tail = word
    first = ''

    if word[0..1] != 'ch'
      letters_to_move = 1
    else
      letters_to_move = 2
    end

    uppercased = word.first =~ /[A-Z]/

    if word.first =~ CONSONANT
      tail = word[letters_to_move..-1]
      first = word.slice(0, letters_to_move)
    end

    tail = tail.capitalize if uppercased

    "#{tail}#{first.downcase}ay"
  end
end
