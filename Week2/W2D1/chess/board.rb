require_relative 'piece.rb'

class EmptySpaceError < StandardError
end
class IllegalMoveError < StandardError
end

class Board

  attr_accessor :grid

  def initialize
    @null_p = NullPiece.instance


    @grid = Array.new(8) { Array.new(8){[]}}
    (0..7).to_a.product((0..7).to_a).each do |pos|
      r, c = pos
      
      if [1, 6].include?(c)
        @grid[r][c] = Pawn.new(r, c)
      elsif condition

      end
    end
    # @grid = Array.new(8) do |row|
    #    [Piece.new(row, 0), Piece.new(row, 1), @null_p,
    #   @null_p, @null_p, @null_p, Piece.new(row, 6), Piece.new(row, 7)]
    # end
  end

  def move_piece(start_pos, end_pos)

    unless (in_bounds?(end_pos)) # if piece @ start pos is on same team as piece @ end pos, raise error. # or end pos is illegal
      raise IllegalMoveError # If the piece can't move to end_pos
    end

      self[end_pos] = self[start_pos]
      self[start_pos] = @null_p

      self[start_pos].pos = end_pos

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value;
  end

  def in_bounds?(end_pos)
    end_pos.none?{|c| c < 0 || c > 7}
  end
end
