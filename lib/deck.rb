require_relative 'card'

class Deck
  attr_reader :cards

  RANKS = (2..10).to_a.map { |num| num.to_s } + ['J', 'Q', 'K', 'A']
  SUITS = ["♠", "♥", "♦", "♣"]

  def initialize
    @cards = Array.new
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def draw!
    @cards.pop
  end

end
