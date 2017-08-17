require 'singleton'

module SlidingPiece
  def moves
    dirs = move_dirs
  end
end

module SteppingPiece

end

class Piece
  def initialize(row, col)
    @row = row
    @col = col
  end
  
  def image
    "f"
  end

  def moves
    []
  end
  def valid_move?(end_pos)
    moves.include?(end_pos)

  end
end

class Bishop < Piece
  include SlidingPiece
  def move_dirs
    {diagonal: true}
  end
  def image
    "B"
  end
end

class Rook < Piece
  include SlidingPiece
  def move_dirs
    {orthogonal: true}
  end
  def image
    "R"
  end
end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    {diagonal: true, orthogonal: true}
  end
  def image
    "Q"
  end
end

class Knight < Piece
  include SteppingPiece

  def image
    "N"
  end
end

class King < Piece
  include SteppingPiece

  def image
    "K"
  end
end

class Pawn < Piece

  def image
    "P"
  end
end
class NullPiece < Piece
  include Singleton
  def initialize
  end
  def image
    " "
  end
end
