require 'singleton'
require 'byebug'

module SlidingPiece
  def moves
    possible_moves = []
    offsets = []
    offsets += [[0,1],[1,0],[-1,0],[0,-1]]    if move_dirs[:orthogonal]
    offsets += [[1,1],[-1,1],[-1,-1],[1,-1]]  if move_dirs[:diagonal]

    offsets.each do |pos|
      multi = 1

      loop do
        r, c = pos
        next_pos = [@row + r * multi, @col + c * multi]

        break unless @board.in_bounds?(next_pos) # stop if out of bounds
        break if @board[next_pos].color == @color # stop if trying to friendly place
        multi += 1
        possible_moves << next_pos

        break unless @board[next_pos].color == self.color || @board[next_pos].is_a?(NullPiece) # stop if enemy spot, but after adding to move list
      end
    end
    # debugger
    return possible_moves
  end
end

module SteppingPiece
  def moves
    possible_moves = []
    offsets = []

    if move_dirs[:one_step]
      offsets = [[0,1],[1,0],[-1,0],[0,-1], [1,1],[-1,1],[-1,-1],[1,-1]]
    elsif move_dirs[:l_step]
      offsets = [[2,1],[2,-1],[-2,1],[-2,-1],[1, 2], [1, -2], [-1, 2], [-1, -2]]
    end

    offsets.each do |pos|
        r, c = pos
        next_pos = [@row + r, @col + c]

        next unless @board.in_bounds?(next_pos) # stop if out of bounds
        next if @board[next_pos].color == @color # stop if trying to friendly place

        possible_moves << next_pos

        next unless @board[next_pos].color == self.color || @board[next_pos].is_a?(NullPiece) # stop if enemy spot, but after adding to move list
    end
    # debugger
    return possible_moves
  end
end

class Piece

  attr_accessor :color, :board

  def initialize(row, col, board)
    @row = row
    @col = col
    @color = col < 4 ? :white : :black
    @board = board
  end

  def set_pos(pos)
    @row, @col = pos
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

  def valid_moves
    # IF the player IS in check:
    #   Make an empty array of valid_moves. Then:

    #   1. Take every one of the player's pieces, and get their valid moves.
    v_moves = moves.select do |move|
      dupe = @board.duplicate_board
      dupe.move_piece([@row, @col], move)
      !dupe.in_check?(@color)
    end
    #   2. FOR every valid move, make a duplicate_board.
    #      THEN make that move on the duplicate board, and
    #      see if the player is STILL in_check?.
    #      IF the player is no longer in_check?, add that move
    #      to valid moves.
    #   3. After checking all pieces' moves, if valid_moves is empty, checkmate!
    return v_moves
  end
end

class Pawn < Piece
  def moves
    possible_moves = []
    offsets = []

    offsets << [0, 1] if @color == :white && @board[[@row, @col + 1]].is_a?(NullPiece)
    offsets << [0, -1] if @color == :black && @board[[@row, @col - 1]].is_a?(NullPiece)

    offsets << [0, 2]  if @color == :white && @col == 1  # starting move
    offsets << [0, -2] if @color == :black && @col == 6

    offsets << [1, 1]  if @board.in_bounds?([@row + 1, @col + 1]) && (@board[[@row + 1, @col + 1]].color == :black && @color == :white)
    offsets << [-1, 1]  if @board.in_bounds?([@row - 1, @col + 1]) && (@board[[@row - 1, @col + 1]].color == :black && @color == :white)

    offsets << [1, -1]   if @board.in_bounds?([@row + 1, @col - 1]) && (@board[[@row + 1, @col - 1]].color == :white && @color == :black)
    offsets << [-1, -1]  if @board.in_bounds?([@row - 1, @col - 1]) && (@board[[@row - 1, @col - 1]].color == :white && @color == :black)

    offsets.each do |pos|
        r, c = pos
        next_pos = [@row + r, @col + c]

        next unless @board.in_bounds?(next_pos) # stop if out of bounds
        next if @board[next_pos].color == @color # stop if trying to friendly place

        possible_moves << next_pos

        next unless @board[next_pos].color == self.color || @board[next_pos].is_a?(NullPiece) # stop if enemy spot, but after adding to move list
    end
    # debugger
    return possible_moves
  end
  def image
    @color == :white ? "\u2659 " : "\u265f "
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @color = :null
  end
  def image
    "  "
  end
end

class King < Piece
  include SteppingPiece
  def move_dirs
      {one_step: true}
  end
  def image
    @color == :white ? "\u2654 " : "\u265A "
  end
  def get_pos
    [@row,@col]
  end
end

class Rook < Piece
  include SlidingPiece
  def move_dirs
    {orthogonal: true}
  end

  def image
    @color == :white ? "\u2656 " : "\u265C "
  end
end

class Bishop < Piece
  include SlidingPiece
  def move_dirs
    {diagonal: true}
  end
  def image
    @color == :white ? "\u2657 " : "\u265D "
  end
end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    {diagonal: true, orthogonal: true}
  end
  def image
    @color == :white ? "\u265B " : "\u265B "
  end
end

class Knight < Piece
  include SteppingPiece
  def move_dirs
    {l_step: true}
  end
  def image
    @color == :white ? "\u2658 " : "\u265E "
  end
end
