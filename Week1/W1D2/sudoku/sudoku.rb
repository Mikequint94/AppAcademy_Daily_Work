require_relative 'board.rb'
require_relative 'tile.rb'
require_relative 'lib/colorize.rb'
require_relative 'lib/colorized_string.rb'

class Sudoku


  def initialize(gridfile)
    grid = []
    File.readlines(gridfile).each {|row| grid << row[0..-2].chars}
    @board = Board.new(grid)
    puts "Welcome to Sudoku".colorize(:color => :blue, :background => :light_yellow)
  end

  def play
    until @board.solved?
      @board.render
      update_value(prompt_pos, prompt_val)
    end
    puts "You win!!"

  end

  def prompt_pos
    puts "Which tile would you like to change? (ex. 3,2)"
    position = gets.chomp
    row = position[0].to_i
    col = position[-1].to_i
    [row,col]
  end

  def prompt_val
    begin
      puts "What number would you like to write in? (1 - 9)"
      input = gets.chomp

      raise "Put a valid number 1 thru 9!" if input.length !=1 || input =="0"

    rescue
      retry
    end
    input
  end

  def update_value(pos, val)
    if @board[pos].given == false
      @board[pos].value = val
    else
      puts "You can't change a given number!"
      update_value(prompt_pos, prompt_val)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  Sudoku.new("puzzles/sudoku1-almost.txt").play
end
