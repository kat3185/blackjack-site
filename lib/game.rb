require_relative 'hand'

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

  def dealer
    dealer_hand.name
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
    if player_hand.bust?
      "<h2> #{player_hand.name.upcase}  BUSTS!  Dealer wins! </h2>"
    elsif dealer_hand.bust?
      "<h2> DEALER BUSTS!  You win!  Good job, #{player_hand.name}.</h2>"
    elsif player_hand.score > dealer_hand.score
      "<h2> #{player_hand.name.upcase} WINS! Congrats! </h2>"
    elsif player_hand.score < dealer_hand.score
      "<h2> DEALER WINS!  Better luck next time, #{player_hand.name}! </h2>"
    else
      "<h2> Your scores are tied!  DEALER WINS! </h2>
      <h3> Haha! </h3>"
    end
  end
end
