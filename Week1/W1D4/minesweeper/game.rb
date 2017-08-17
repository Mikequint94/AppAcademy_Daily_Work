require_relative 'board'

class Game

  def initialize
    @board = Board.new

  end

  def play
    @board.render
    until won?
      play_turn
      @board.render
    end

    puts "You Win!!!"
  end

  def won?
    false
  end

  def play_turn
    puts "Where would you like to reveal? (ex. 3,4)"
    pos = parse_pos(gets.chomp)

    if @board[pos].bomb
      puts "You Lose :((("
      @board.render_loss
      exit
    else
      @board[pos].reveal
      @board.reveal_neighbors(pos) if @board[pos].bomb_idx == 0
    end
  end

  def parse_pos(pos)
    [Integer(pos[0]), Integer(pos[-1])]
  end

end

game = Game.new
game.play
