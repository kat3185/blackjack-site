require_relative '../lib/game'
require 'rspec'

describe Game do
  let(:game) { Game.new("Yournam") }
  let(:non_face_card) { Card.new(6, "♥") }
  let(:face_card) { Card.new('K', "♥") }
  let(:ace) { Card.new('A', "♥") }

  describe '#new' do
    it 'has a player hand and a dealer hand' do
      expect(game.player_hand).to be_a(Hand)
      expect(game.dealer_hand).to be_a(Hand)
    end
    it 'has a deck' do
      expect(game.deck).to be_a(Deck)
    end
  end
  describe '#deal' do
    it 'deals two cards to each player' do
      game.deal
      game_cards = game.deck.cards
      expect(game_cards.count).to eq(48)
    end
    it 'can score the hands' do
      game.player_hand.hit!(face_card)
      game.player_hand.hit!(face_card)
      game.player_hand.hit!(ace)
      expect(game.player_hand.score).to eq(21)
    end
  end

  describe '#player' do
    it 'returns the player name' do
      expect(game.player).to eq("Yournam")
    end
  end

  describe '#dealer_turn' do
    it 'stands if the dealer\s score is over 17' do
      game.dealer_hand.hit!(face_card)
      game.dealer_hand.hit!(face_card)
      game.dealer_turn
      expect(game.dealer_hand.score).to eq(20)
    end
    it 'hits if the dealer\s score is 17 or under' do
      game.dealer_hand.hit!(face_card)
      game.dealer_hand.hit!(non_face_card)
      game.dealer_turn
      expect(game.dealer_hand.score).not_to eq(16)
      game.dealer_hand.hit!(Card.new("A", "♥"))
      expect(game.dealer_hand.score).not_to eq(17)
    end
  end

end
