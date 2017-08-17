class Deck
  # include Singleton

  attr_accessor :cards

  def initialize
    @cards = make_cards
  end


  def make_cards
    result = []
    suits = ["Diamond", "Heart", "Spade", "Club"]
    numbers = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suits.each do |suit|
      numbers.each do |num|
        result << Card.new(num, suit)
      end
    end
    result
  end

  def shuffle_cards
    shuffled_cards = @cards.shuffle
    shuffled_cards
  end

  def count
    @cards.length
  end

  def take_cards(num)
    picked_cards = self.shuffle_cards.take(num)
    picked_cards.each do |card|
      @cards.delete(card)
    end
    picked_cards
  end

  # def play
  #   deal
  # end

end
