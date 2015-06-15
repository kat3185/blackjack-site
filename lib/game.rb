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
    if player_hand.name.downcase == "yourname"
      "<h2><center> YOU LOSE!</center></h2>
      <h3><center>I told you you would lose if you entered yourname!</center></h3>"
    elsif player_hand.bust?
      "<h2><center> #{player_hand.name.upcase} BUSTS!  Dealer wins! </center></h2>"
    elsif dealer_hand.bust?
      "<h2><center> DEALER BUSTS!  You win!  Good job, #{player_hand.name}.</center></h2>"
    elsif player_hand.score > dealer_hand.score
      "<h2><center> #{player_hand.name.upcase} WINS! Congrats! </center></h2>"
    elsif player_hand.score < dealer_hand.score
      "<h2><center> DEALER WINS!  Better luck next time, #{player_hand.name}! </center></h2>"
    else
      "<h2><center> Your scores are tied!  DEALER WINS! </center></h2>
      <h3><center> Haha! </center></h3>"
    end
  end
end
