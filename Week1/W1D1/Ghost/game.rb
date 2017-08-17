require_relative 'player.rb'

class Game
  def initialize(players, dictionary = "dictionary.txt")
    @player1 = Player.new(players[:player1])
    @player2 = Player.new(players[:player2])
    @current_player = @player1
    @previous_player = @player2
    @fragment = ""
    dictionary_arr = []
    File.readlines(dictionary).each{|word| dictionary_arr << word.chomp}
    @dictionary = dictionary_arr
  end

  def play
    until won?
      play_round
    end
    puts "#{@previous_player.name} loses the game :("
  end

  def won?
    @previous_player.record.length == 5
  end

  def won_round?
    @dictionary.include?(@fragment)
  end

  def play_round
    until won_round?
      take_turn(@current_player)
      next_player!
    end
    puts "#{@previous_player.name} gains a letter"
    @previous_player.record << "GHOST"[@previous_player.record.length]
    puts "#{@previous_player.name} has #{@previous_player.record}"
    @fragment = ""
  end

  def next_player!
    if @current_player == @player1
      @current_player = @player2
      @previous_player = @player1
    else
      @current_player = @player1
      @previous_player = @player2
    end
  end

  def take_turn(player)
    puts "It's #{@current_player.name}'s turn"
    puts "Current fragment: #{@fragment}"
    letter = player.guess

    if valid_play?(letter)
      @fragment << letter
    else
      puts "Invalid guess. Please try again"
      take_turn(player)
    end

  end

  def valid_play?(string)
    return false if string.length > 1
    return false unless ("a".."z").include?(string.downcase)

    @fragment << string

    @dictionary.each do |word|
      if word[0..@fragment.length-1] == @fragment
        @fragment = @fragment[0...-1]
        return true
      end
    end
    @fragment = @fragment[0...-1]
    false
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "How many players do you have?"
  num_players = gets.chomp.to_i
  players = []
  (1..num_players).each do |num|
    puts "Please type the name of player #{num}"
    players << gets.chomp
  end

  #players = {:player1 => "Mike", :player2 => "Adrian"}
  Game.new(players).play
end
