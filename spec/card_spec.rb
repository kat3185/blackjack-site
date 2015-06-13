require_relative '../lib/card'
require 'rspec'
require 'pry'

describe Card do
  let(:card) {Card.new(3, "♦")}
  let(:facecard) {Card.new('K', "♠")}

  describe '#new' do
    it 'has a rank and a suit' do
      expect(card.rank).to eq(3)
      expect(card.suit).to eq("♦")
    end
  end

  describe '#value' do
    it 'has a value corresponding to its rank' do
      expect(card.value).to eq(3)
      expect(facecard.value).to eq(10)
    end
  end

  describe '#id' do
    it 'returns the rank and suit of the card in a string' do
      expect(card.id).to eq("3♦")
      expect(facecard.id).to eq("K♠")
    end
  end

end
