# frozen_string_literal: true

require 'pig_latin'

RSpec.describe PigLatin, type: :model do
  it 'should convert pig into igpay' do
    converted = PigLatin.new.convert('pig')
    expect(converted).to eq('igpay')
  end

  it 'should only ay if the word begins with a vowel (aeiou)' do
    expect(PigLatin.new.convert('apple')).to eq 'appleay'
  end

  it 'should maintain capitalization' do
    expect(PigLatin.new.convert('Apple')).to eq 'Appleay'
    expect(PigLatin.new.convert('Pig')).to eq 'Igpay'
  end

  it "moves two letters in the case of 'ch'" do
    expect(PigLatin.new.convert('child')).to eq 'ildchay'
  end

  it 'deals with sentences' do
    expect(PigLatin.new.convert('Apple pig')).to eq 'Appleay igpay'
  end

  it 'handles punctuation' do
    expect(PigLatin.new.convert('Abtion is nice.')).to eq 'Abtionay isay icenay.'
  end
end
