class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def id
    rank.to_s + suit
  end

  def value
    if rank == 'J' || rank == 'Q' || rank == 'K'
      10
    else
      rank.to_i
    end
  end

end
