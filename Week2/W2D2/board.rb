require_relative 'piece.rb'
require 'byebug'

class EmptySpaceError < StandardError
end
class IllegalMoveError < StandardError
end
class WrongColorError < StandardError
end

class Board

  attr_accessor :grid

  def initialize
    @null_p = NullPiece.instance


    @grid = Array.new(8) { Array.new(8){[]}}
    (0..7).to_a.product((0..7).to_a).each do |pos|
      r, c = pos

      if [1, 6].include?(c)
        @grid[r][c] = Pawn.new(r, c, self)
      elsif [0, 7].include?(r) && [0, 7].include?(c)# rook
        @grid[r][c] = Rook.new(r, c, self)
      elsif [1, 6].include?(r) && [0, 7].include?(c)# rook
        @grid[r][c] = Knight.new(r, c, self)
      elsif [2, 5].include?(r) && [0, 7].include?(c)# rook
        @grid[r][c] = Bishop.new(r, c, self)
      elsif [3].include?(r) && [0, 7].include?(c)# rook
        @grid[r][c] = Queen.new(r, c, self)
      elsif [4].include?(r) && [0, 7].include?(c)# rook
        @grid[r][c] = King.new(r, c, self)
      elsif c.between?(2, 5)
        @grid[r][c] = @null_p
      end
    end
  end

  def duplicate_board
    # 1 make a new board
    board_copy = Board.new
    # 2deep dupe original grid, and overwrite the new grid
    board_copy.grid = @grid.deep_dup
    # 3. go through the new pieces and reset their references to board
    board_copy.grid.flatten.each {|p| p.board = board_copy unless p.is_a?(NullPiece) }

    return board_copy
  end

  def in_check?(color)
    king = @grid.flatten.find {|piece| piece.is_a?(King) && piece.color == color}
    king_pos = king.get_pos
    #debugger
    enemy_pieces = @grid.flatten.select {|piece| piece.color != color && piece.color != :null}
    all_enemy_moves = []

    enemy_pieces.each do |enemy|
      all_enemy_moves += enemy.moves
    end

    all_enemy_moves.include?(king_pos)
  end

  def checkmate?(color)
  # If the player is in check, and if none of the player's pieces have any #valid_moves (to be implemented in a moment), then the player is in checkmate.
    friendly_pieces = @grid.flatten.select {|piece| piece.color == color}
    return true if friendly_pieces.none? {|p| p.valid_moves.count > 0}
  end

  def move_piece(start_pos, end_pos)
    unless (in_bounds?(end_pos)) # if piece @ start pos is on same team as piece @ end pos, raise error. # or end pos is illegal
      raise IllegalMoveError # If the piece can't move to end_pos
    end

      self[end_pos] = self[start_pos]

      self[end_pos].set_pos(end_pos)

      self[start_pos] = @null_p
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def in_bounds?(end_pos)
    end_pos.none?{|c| c < 0 || c > 7}
  end
end

# Needed for duplicate_board
class Array
  def deep_dup
    self.map {|l| l.is_a?(Array) ? l.deep_dup : l}
  end
end
