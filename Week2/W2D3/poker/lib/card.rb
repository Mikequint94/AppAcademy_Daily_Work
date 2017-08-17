class Card

  attr_reader :number, :suit

  def initialize(number, suit)
    @number = number
    @suit = suit

  end
end

# card1 < card2
#
# card1 == card2
#
# [cards].sort
