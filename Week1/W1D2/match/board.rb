class Board

  attr_accessor :grid

  def initialize(grid= Array.new(4){Array.new(2)})
    @grid = grid
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    values = ["A", "B", "C", "D", "A", "B", "C", "D"].shuffle
    (0..1).each do |col|
      (0..3).each do |row|
        @grid[row][col] = Card.new(values.pop)
      end
    end
  end

  def won?
    (0..1).all? do |col|
      (0..3).all? do |row|
        @grid[row][col].visible?
      end
    end
  end

  def render
    row0 = "|"
    (0..1).each do |col|
      if @grid[0][col].visible?
        row0 << " #{@grid[0][col].value} |"
      else
        row0 << "   |"
      end
    end
    row1 = "|"
    (0..1).each do |col|
      if @grid[1][col].visible?
        row1 << " #{@grid[1][col].value} |"
      else
        row1 << "   |"
      end
    end
    row2 = "|"
    (0..1).each do |col|
      if @grid[2][col].visible?
        row2 << " #{@grid[2][col].value} |"
      else
        row2 << "   |"
      end
    end
    row3 = "|"
    (0..1).each do |col|
      if @grid[3][col].visible?
        row3 << " #{@grid[3][col].value} |"
      else
        row3 << "   |"
      end
    end

    puts row0
    puts row1
    puts row2
    puts row3

  end


end
