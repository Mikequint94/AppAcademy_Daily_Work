require_relative 'card.rb'
require_relative 'board.rb'

class Game
attr_accessor :board, :previous_guess, :guessed_pos


  def initialize
    @board = Board.new
    @previous_guess = nil
    @guessed_pos = nil
  end

  def play


    until over?
      @board.render
      @previous_guess = prompt
      @board[@previous_guess].reveal
      @board.render

      @guessed_pos = prompt
      @board[@guessed_pos].reveal
      @board.render

      make_guess


    end
    puts "Congratulations! You win!"
  end
  def prompt
    puts "Choose a card (ex. 2,3)"
    guess = gets.chomp
    row = guess[0].to_i
    col = guess[-1].to_i
    return [row, col]
  end
  def make_guess

    if @board[@previous_guess].value == @board[@guessed_pos].value
      puts "It's a match!"
    else
      puts "It's not a match."
      @board[@previous_guess].hide
      @board[@guessed_pos].hide
    end
    sleep(3)
    system("clear")
  end

  def over?
    @board.won?
  end


end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
