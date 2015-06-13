require_relative 'deck'

class Hand
  attr_reader :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit!(card)
  @cards << card
  end

  def score
    score = 0
    non_ace_cards = cards.map { |card| card if card.rank != 'A' }.compact
    ace_cards = cards.map { |card| card if card.rank == 'A' }.compact
    non_ace_cards.each do |card|
      score += card.value
    end
    ace_cards.each do |card|
      score += 1
      if score < 12
        score += 10
      end
    end
    score
  end

  def print_hand
    strings = ""
    cards.each do |card|
    strings += "<p>#{name} was dealt: #{card.id}</p>"
    end
    strings
  end

  def bust?
    score > 21
  end

  def display_last_card_value
    if cards.last.rank == 'A'
      11
    else
      cards.last.value
    end
  end

end
