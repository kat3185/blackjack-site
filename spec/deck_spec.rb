require_relative '../lib/deck'
require 'rspec'

describe Deck do
  let(:deck) { Deck.new }

  describe '#deck' do
    it 'has a reader for cards' do
      expect(deck.cards).to be_an(Array)
    end
  end

  describe '#new' do
    it 'contains 52 cards' do
      expect(deck.cards.count). to eq(52)
    end
    it 'does not contain two identical cards' do
      cards = deck.cards
      card_values = cards.map { |card| "#{card.rank}#{card.suit}" }
      expect(card_values.uniq.count).to eq(52)
    end
  end

  describe '#draw!' do
    it 'returns a card from the deck' do
      expect(deck.draw!).to be_a(Card)
    end
    it 'actually removes the card from the deck' do
      deck.draw!
      expect(deck.cards.count).to eq(51)
    end

  end
end
