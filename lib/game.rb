require_relative 'hand'
require_relative 'card'

class Game
  attr_reader :player_hand, :dealer_hand, :deck

  def initialize(player)
    @player_hand = Hand.new(player)
    @dealer_hand = Hand.new("Dealer")
    @deck = Deck.new
  end

  def player
    player_hand.name
  end

  def deal
    2.times do @player_hand.hit!(deck.draw!) end
    2.times do @dealer_hand.hit!(deck.draw!) end
  end

  def dealer_turn
    while dealer_hand.score < 17
      dealer_hand.hit!(deck.draw!)
    end
  end

  def determine_winner
    if player_hand.name.downcase == "your name"
      "YOU LOSE! \n\n I told you you would lose if you entered your name!"
    elsif player_hand.bust?
      "#{player_hand.name.upcase} BUSTS!  Dealer wins!"
    elsif dealer_hand.bust?
      "DEALER BUSTS!  You win!  Good job, #{player_hand.name}."
    elsif player_hand.score > dealer_hand.score
      "#{player_hand.name.upcase} WINS! Congrats!"
    elsif player_hand.score < dealer_hand.score
      "DEALER WINS!  Better luck next time, #{player_hand.name}!"
    else
      "Your scores are tied!  DEALER WINS!  Haha!"
    end
  end
end
