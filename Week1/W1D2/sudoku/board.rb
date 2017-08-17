class Board

  attr_accessor

  def initialize(grid)
    @grid = grid
    assign_tiles
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def render
    @grid.each do |row|
      row.each do |ch|
        if ch.given
          print ch.value.colorize(:color => :red, :background => :light_yellow)
        else
          print ch.value.colorize(:color => :green, :background => :light_yellow)
        end
      end
      puts
    end

  end



  def solved?
    tester = []
    comparison = ("1".."9").to_a

    @grid.each do |row|
      row.each do |ch|
        tester << ch.value
      end
      return false unless tester.sort == comparison
      tester = []
    end

    (0..8).each do |col|
      (0..8).each do |row|
        tester << @grid[row][col].value
      end
      return false unless tester.sort == comparison
      tester = []
    end



    return true
  end

  def assign_tiles
    (0..8).each do |row|
      (0..8).each do |col|
        temp = @grid[row][col]
        @grid[row][col] = Tile.new(temp)
      end
    end
  end


end
