require_relative '../lib/hand'
require 'rspec'

describe Hand do
  let(:hand) { Hand.new("Yournam") }
  let(:non_face_card) { Card.new(6, "♥") }
  let(:face_card) { Card.new('K', "♥") }
  let(:ace) { Card.new('A', "♥") }

  describe '#new' do
    it 'has a player or dealer associated with it' do
      expect(hand.name).to eq("Yournam")
    end
  end

  describe '#cards' do
    it 'lists the cards in the hand' do
      expect(hand.cards).to be_an(Array)
    end

  end

  describe '#hit!' do
    it 'adds a specific card to a hand' do
      hand.hit!(non_face_card)
      card_array = hand.cards.map { |card| card.value }
      expect(card_array).to eq([non_face_card.value])
    end
    it 'works for face cards too' do
      hand.hit!(face_card)
      card_array = hand.cards.map { |card| card.value }
      expect(card_array).to eq([face_card.value])
    end
  end
  describe '#score' do
    it 'returns the total value of the hand' do
      hand.hit!(face_card)
      hand.hit!(non_face_card)
      expect(hand.score).to eq(16)
    end
    it 'works more than once' do
      hand.hit!(face_card)
      hand.hit!(face_card)
      expect(hand.score).to eq(20)
    end
    it 'values aces at 1 if score is greater than 10' do
      hand.hit!(face_card)
      hand.hit!(face_card)
      hand.hit!(ace)
      expect(hand.score).to eq(21)
    end
    it 'can handle many aces' do
      hand.hit!(face_card)
      hand.hit!(ace)
      hand.hit!(ace)
      hand.hit!(ace)
      hand.hit!(ace)
      expect(hand.score).to eq(14)
    end
  end
  describe '#bust?'do
    it 'returns true if you busted' do
      hand.hit!(face_card)
      hand.hit!(face_card)
      hand.hit!(face_card)
      expect(hand.bust?). to eq(true)
    end
    it 'returns false if you didn\'t bust' do
      hand.hit!(face_card)
      hand.hit!(face_card)
      expect(hand.bust?). to eq(false)
    end

  end


end
