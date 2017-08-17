require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  attr_accessor :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    system("clear")
    grid = @board.grid

    # print "   " + (0..7).to_a.join(" ")
    puts

    grid.each_with_index do |row, i| # i is 0 to 7
      # print "#{i} "
      print "   "

      row.each_with_index do |piece, i2| # i is 0 to 7
        unless [i, i2] == @cursor.cursor_pos
          print piece.image.colorize(:color => :black, :background => :white) if (i+i2).odd?
          print piece.image.colorize(:color => :white, :background => :black) if (i+i2).even?
        else
          print piece.image.blue.on_red.blink
        end
      end
      puts
    end

    nil
  end
end
