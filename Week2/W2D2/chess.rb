require_relative "board"
require_relative "display"


class Chess

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @current_color = :white
    @previous_color = :black
  end

  def switch!
    @current_color, @previous_color = @previous_color, @current_color
  end

  def play
    start_pos = nil

    until won?
      begin
        # if @board.checkmate?(@previous_color)
        #   puts "YOU LOSE"
        #   sleep(2)
        #   raise "Game Over"
        # end
        @display.render
        puts "It's player #{@current_color}'s turn"
        response = @display.cursor.get_input #response could be enter, space, could be cursor_pos[x,y]

        if start_pos.nil? && response
          raise WrongColorError if @board[response].color != @current_color
          start_pos = response.dup

          raise EmptySpaceError if @board[start_pos].is_a?(NullPiece)
        elsif response
          raise IllegalMoveError unless @board[start_pos].valid_move?(response)
          @board.move_piece(start_pos, response)
          @display.render

          start_pos = nil
          # if @board.in_check?(@previous_color)
          #   puts "#{@previous_color} is in check!!"
          #   #puts "#{@previous_color} is in checkMAMAMAMAMTE!!" if @board.checkmate?(@previous_color)
          #   sleep(1.6)
          # end
          switch!
        end
      rescue EmptySpaceError
        puts "No piece found at #{start_pos}"
        sleep(1.5)
        start_pos = nil
        retry
      rescue IllegalMoveError
        puts "#{@board[start_pos].class} can't move there!"
        sleep(1.5)
        start_pos = nil
        retry
      rescue WrongColorError
        puts "That's not player #{@current_color}'s piece'"
        sleep(1.5)
        start_pos = nil
        retry
      end

    end

  end

  def won? # This is a stub!!!!!!!!?!!!!!!
    false
  end
end
