require_relative "board"
require_relative "display"


class Chess
  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    start_pos = nil

    until won?
      begin
        @display.render
        response = @display.cursor.get_input #response could be enter, space, could be cursor_pos[x,y]
        if start_pos.nil? && response
          start_pos = response.dup
          raise EmptySpaceError if @board[start_pos].is_a?(NullPiece)
        elsif response
          raise IllegalMoveError unless @board[start_pos].valid_move?(response)
          @board.move_piece(start_pos, response)
          start_pos = nil
        end
      rescue EmptySpaceError
        puts "No piece found at #{start_pos}"
        sleep(1.5)
        start_pos = nil
        retry
      rescue IllegalMoveError
        puts "#{self[start_pos].class} can't move to #{end_pos}!"
        start_pos = nil
        retry
      end
    end

  end

  def won? # This is a stub!!!!!!!!?!!!!!!
    false
  end
end
