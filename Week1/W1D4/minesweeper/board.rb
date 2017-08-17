require_relative 'tile'

class Board

  attr_accessor :grid

  def initialize(board_size = 9)
    @grid = Array.new(board_size) {Array.new(board_size) {Tile.new(false,false)}}
    place_bombs
    assign_bomb_value
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def generate_bombs(num_bomb = 15)
    bombs = []
    until bombs.length == num_bomb
      pos = [rand(@grid.size-1), rand(@grid.size-1)]
      bombs << pos unless bombs.include?(pos)
    end
    bombs
  end


  def render
    print "  "
    (0..8).to_a.each {|el| print el.to_s + " "}
    @grid.each_index do |idx|
      puts
      print "#{idx} "
      @grid[idx].each do |el|
        print "#{el.bomb_idx} " if el.visible
        print "  " unless el.visible
      end
    end
    puts
  end

  def render_loss
    print "  "
    (0..8).to_a.each {|el| print el.to_s + " "}
    @grid.each_index do |idx|
      puts
      print "#{idx} "
      @grid[idx].each do |el|
        print "* " if el.bomb
        print "#{el.bomb_idx} " if el.visible
        print "  " unless (el.bomb || el.visible)
      end
    end
    puts
  end

  def place_bombs
    bombs = generate_bombs
    bombs.each do |pos|
      self[pos].bomb = true
    end
  end

  def assign_bomb_value
    @grid.each_index do |row|
      @grid.each_index do |col|
        if row < 8
          @grid[row][col].add_bomb if @grid[row+1][col].bomb
        end
        if row > 0
          @grid[row][col].add_bomb if @grid[row-1][col].bomb
        end
        if col < 8
          @grid[row][col].add_bomb if @grid[row][col+1].bomb
        end
        if col > 0
          @grid[row][col].add_bomb if @grid[row][col-1].bomb
        end
        if row < 8 && col < 8
          @grid[row][col].add_bomb if @grid[row+1][col+1].bomb
        end
        if row > 0 && col > 0
          @grid[row][col].add_bomb if @grid[row-1][col-1].bomb
        end
        if row < 8 && col > 0
          @grid[row][col].add_bomb if @grid[row+1][col-1].bomb
        end
        if row > 0 && col < 8
          @grid[row][col].add_bomb if @grid[row-1][col+1].bomb
        end
      end
    end
  end

  def reveal_neighbors(pos)
    row, col = pos[0], pos[1]
        if row < 8
          @grid[row+1][col].reveal
        end
        if row > 0
          @grid[row-1][col].reveal
        end
        if col < 8
          @grid[row][col+1].reveal
        end
        if col > 0
          @grid[row][col-1].reveal
        end
        if row < 8 && col < 8
          @grid[row+1][col+1].reveal
        end
        if row > 0 && col > 0
          @grid[row-1][col-1].reveal
        end
        if row < 8 && col > 0
          @grid[row+1][col-1].reveal
        end
        if row > 0 && col < 8
          @grid[row-1][col+1].reveal
        end

  end

end
