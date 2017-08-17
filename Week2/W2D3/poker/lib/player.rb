require 'deck'
require 'hand'

class Player

  attr_reader :hand, :name

  def initialize(name, deck)
    @name = name
    @hand = Hand.new(deck.take_cards(5))
  end

end
